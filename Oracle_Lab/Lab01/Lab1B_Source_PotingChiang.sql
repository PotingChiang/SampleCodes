-- Lab01_B:
-- Q3
Drop Procedure PR_Q3;
Create Or Replace Procedure PR_Q3 (p_FName MEMBER.FIRST_NAME%TYPE, p_LName MEMBER.LAST_NAME%TYPE)
authid current_user 
IS
  v_Current_Status_YN Member.Current_Status_YN%TYPE;
  v_Member_Number MEMBER.MEMBER_NUMBER%Type;
  e_NotCurrentStatus_Message Exception;
Begin   
  Select MEMBER_NUMBER, Current_Status_YN Into v_Member_Number, v_Current_Status_YN
        From MEMBER
          Where Upper(First_Name) = Upper(p_FName) 
                  And Upper(Last_Name) = Upper(p_LName);           
                 
    If v_Current_Status_YN = 'N' Then
      Raise e_NotCurrentStatus_Message;
    Else          
      Insert Into Rental_Invoice(Invoice_Number, Member_Number)
      Values
        (Seq_Invoice.NextVal, v_Member_Number);
    End If;     
  Exception 
    When No_data_Found Then
     RAISE_APPLICATION_ERROR(-20000, 'Error! The member '||p_FName||', '|| p_LName||' does not exist!');
    When Too_Many_Rows Then
      RAISE_APPLICATION_ERROR(-20001, 'Error! '||p_FName||', '||p_LName||' is not unique!');
    when e_NotCurrentStatus_Message Then
      RAISE_APPLICATION_ERROR(-20002, 'Error! The member ' || p_FName || ', ' || p_LName || ' is Not a current member!');
    When Others Then
      RAISE_APPLICATION_ERROR(-20200, 'UnknownError, Please Contact the Support.');
End PR_Q3;
/
Show Errors;

-- Q4 
Drop Package PKG_Q4;
Create or Replace PACKAGE PKG_Q4
authid current_user
Is
  Function FN_Q4(p_FName Member.First_Name%Type, p_LName Member.Last_Name%Type)
    Return VARCHAR2;
    
  Function FN_Q4(p_Member_Number Member.Member_Number%Type)
    Return VARCHAR2;  
End PKG_Q4;
/
Show Errors;

Create or Replace Package Body PKG_Q4
Is
  Function FN_Q4(p_FName Member.First_Name%Type, p_LName Member.Last_Name%Type)
    Return VARCHAR2
  Is
    v_Invoice_Number Rental_Invoice.Invoice_Number%type;
    v_Output Varchar2(500);
    v_Member_Number Member.Member_Number%TYPE;
    Cursor c_OutstandingVoice(p_Member_Number Member.Member_Number%type)
    Is
        Select RI.INVOICE_NUMBER 
          From Rental_Invoice RI 
            LEFT OUTER JOIN  Rental_Invoice_Detail RID 
              On RID.Invoice_Number = RI.Invoice_Number
          Where Member_Number = p_Member_Number 
                  And Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration
                  And Overdue_Paid_YN = 'Y';
  Begin
    Select Member_Number Into v_Member_Number From MEMBER
      Where FIRST_NAME = p_FName And LAST_NAME = p_LName;
      
    Open c_OutstandingVoice(v_Member_Number);
    Fetch c_OutstandingVoice Into v_Invoice_Number;
      If c_OutstandingVoice%NotFound Then
        v_Output := 'The Member with member number '||TO_CHAR(v_Member_Number,'999999')
                                  ||', Named: '||p_FName||', '||p_LName
                                  ||' has No outstanding rental invoice!';
      Else
        v_Output := 'The Member with member number '||TO_CHAR(v_Member_Number, '999999')
                                  ||', Named: '||p_FName||', '||p_LName 
                                  ||' has outstanding rental invoice numbers as following: ';
        Loop
          v_Output := v_Output || To_Char(v_Invoice_Number, '99999') || ', ';
          Fetch c_OutstandingVoice Into v_Invoice_Number;
          Exit When c_Outstandingvoice%NotFound;        
        End loop;
      End IF;
    Close c_OutstandingVoice;
    return RTrim(v_Output, ', ');
    Exception 
      When No_data_Found Then
        v_Output := 'Error! The member '||p_FName||', '|| p_LName||' does not exist!' ;
        Return v_Output;
      When Too_Many_Rows Then
        v_Output := 'Error! '||p_FName||', '||p_LName||' is not unique!';
        Return v_Output;
      When Others Then
        v_Output := 'UnknownError, Please Contact the Support.';
        Return v_Output;
  End FN_Q4;
  
  Function FN_Q4(p_Member_Number Member.Member_Number%Type)
    Return VARCHAR2
  Is
    v_Invoice_Number Rental_Invoice.Invoice_Number%type;
    v_Output Varchar2(500);
    v_FName Member.First_Name%Type;
    v_LName MEMBER.Last_Name%Type;
    Cursor c_OutstandingVoice
    Is
        Select RI.INVOICE_NUMBER 
          From Rental_Invoice RI 
            LEFT OUTER JOIN  Rental_Invoice_Detail RID
              On RID.Invoice_Number = RI.Invoice_Number
          Where Member_Number = p_Member_Number 
                  And Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration
                  And Overdue_Paid_YN = 'Y';
  Begin
    Select First_Name, Last_Name Into v_FName, v_LName From MEMBER
      Where Member_Number = p_Member_Number;
      
    Open c_OutstandingVoice();
    Fetch c_OutstandingVoice Into v_Invoice_Number;
      If c_OutstandingVoice%NotFound Then
        v_Output := 'The Member with member number '||TO_CHAR(p_Member_Number, '999999')
                                  ||', Named: '||v_FName||', '||v_LName
                                  ||' has No outstanding rental invoice!';
      Else
        v_Output := 'The Member with member number '||TO_CHAR(p_Member_Number, '999999')
                                  ||', Named: '||v_FName||', '||v_LName 
                                  ||' has outstanding rental invoice numbers as following: ';
        Loop
          v_Output := v_Output || To_Char(v_Invoice_Number, '99999') || ', ';
          Fetch c_OutstandingVoice Into v_Invoice_Number;
          Exit When c_Outstandingvoice%NotFound;        
        End loop; 
      End IF;
    Close c_OutstandingVoice;
    Return RTrim(v_Output, ', ');  
    Exception 
      When No_data_Found Then
        v_Output := 'Error! The member '||p_Member_Number||' does not exist!';
        Return v_Output;
      When Others Then
        v_Output := 'UnknownError, Please Contact the Support.';
        Return v_Output;
  End FN_Q4;
End PKG_Q4;
/
Show Errors;

-- Q5
Drop Trigger TR_Q5;
Create Or Replace Trigger TR_Q5
Before INSERT
  On Rental_Invoice
For EACH ROW 
Declare
  v_OverdueC Number(3,0);
  v_OutstandingC Number(3,0);
  
Begin 
  Select Count(RI.Invoice_Number) Into v_OverdueC
    From Rental_Invoice RI 
      Left Outer Join Rental_Invoice_Detail RID
        On RI.Invoice_Number = RID.Invoice_Number
    Where Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration
      And Overdue_Paid_YN = 'N'
      And RI.MEMBER_NUMBER = (Select m.MEMBER_NUMBER From Member m 
                                Where m.MEMBER_NUMBER = :New.MEMBER_NUMBER);
  
  Select Count(RI.Invoice_Number) Into v_OutstandingC
    From Rental_Invoice RI 
      Left Outer Join Rental_Invoice_Detail RID
        On RI.Invoice_Number = RID.Invoice_Number
    Where Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration
            And Overdue_Paid_YN = 'Y'
    And RI.MEMBER_NUMBER = (Select m.MEMBER_NUMBER From Member m 
                                Where m.MEMBER_NUMBER = :New.MEMBER_NUMBER);
            
  If v_OverdueC > 5 Or v_OutstandingC > 3 Then
    RAISE_Application_Error(-20100, 'The member cannot rent any more with over 5 overdue or over 3 outstanding records!');
  End If;
  
End TR_Q5;
/
Show Errors;

