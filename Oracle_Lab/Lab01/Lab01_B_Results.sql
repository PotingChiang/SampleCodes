--Q3
--Test a.
Select FIRST_NAME, LAST_NAME, MEMBER_NUMBER
  FROM MEMBER Where FIRST_NAME = 'Dennis' And LAST_NAME='Kent';
  
Exec PR_Q3('Dennis', 'Kent');

Select MEMBER_NUMBER 
  From RENTAL_INVOICE
    Where trunc(INVOICE_DATE) = trunc(SYSDATE) And MEMBER_NUMBER = 250;
    
Select MEMBER_NUMBER 
  From RENTAL_INVOICE
    Where trunc(INVOICE_DATE) = trunc(SYSDATE) And MEMBER_NUMBER = 800;
------------------------- ------------------------------ -------------
FIRST_NAME                LAST_NAME                      MEMBER_NUMBER
------------------------- ------------------------------ -------------
Dennis                    Kent                                     250 
Dennis                    Kent                                     800 
------------------------- ------------------------------ -------------
Error starting at line : 6 in command -
Exec PR_Q3('Dennis', 'Kent')
Error report -
ORA-20001: Error! Dennis, Kent is not unique!
ORA-06512: at "ORCL5_04.PR_Q3", line 24
ORA-06512: at line 1
------------------------- ------------------------------ -------------
no rows selected
------------------------- ------------------------------ -------------
no rows selected
------------------------- ------------------------------ -------------

--Test b.
Select FIRST_NAME, LAST_NAME, MEMBER_NUMBER
  From MEMBER 
    Where FIRST_NAME = 'Jumbo' And LAST_NAME = 'Chiang';
    
Exec PR_Q3('Jumbo', 'Chiang');

Select MEMBER_NUMBER 
  From RENTAL_INVOICE
    Where trunc(INVOICE_DATE) = trunc(SYSDATE) and MEMBER_NUMBER = 
      (Select MEMBER_NUMBER
         FROM MEMBER
          Where First_Name = 'Jumbo' And LAST_NAME = 'Chiang'); 
------------------------- ------------------------------ -------------
no rows selected
------------------------- ------------------------------ -------------
Error starting at line : 38 in command -
Exec PR_Q3('Jumbo', 'Chiang')
Error report -
ORA-20000: Error! The member Jumbo, Chiang does not exist!
ORA-06512: at "ORCL5_04.PR_Q3", line 22
ORA-06512: at line 1
20000. 00000 -  "%s"
*Cause:    The stored procedure 'raise_application_error'
           was called which causes this error to be generated.
*Action:   Correct the problem as described in the error message or contact
           the application administrator or DBA for more information.
------------------------- ------------------------------ -------------
no rows selected
------------------------- ------------------------------ -------------

--Test c.
Select FIRST_NAME, LAST_NAME, MEMBER_NUMBER, CURRENT_STATUS_YN
  From MEMBER 
    Where FIRST_NAME = 'Jay' And LAST_NAME = 'Smith';
    
Exec PR_Q3('Jay', 'Smith');

Select MEMBER_NUMBER 
  From RENTAL_INVOICE
    Where trunc(INVOICE_DATE) = trunc(SYSDATE) and MEMBER_NUMBER = 
      (Select MEMBER_NUMBER
         FROM MEMBER
          Where First_Name = 'Jay' And LAST_NAME = 'Smith');

FIRST_NAME                LAST_NAME                      MEMBER_NUMBER CURRENT_STATUS_YN
------------------------- ------------------------------ ------------- -----------------
Jay                       Smith                                    730 N                 
------------------------- ------------------------------ ------------- -----------------
Error starting at line : 69 in command -
Exec PR_Q3('Jay', 'Smith')
Error report -
ORA-20002: Error! The member Jay, Smith is Not a current member!
ORA-06512: at "ORCL5_04.PR_Q3", line 26
ORA-06512: at line 1
------------------------- ------------------------------ ------------- -----------------
no rows selected
------------------------- ------------------------------ ------------- -----------------
          
--Test d.
Select FIRST_NAME, LAST_NAME, MEMBER_NUMBER
  FROM MEMBER
    Where First_Name = 'Dave' And LAST_NAME = 'Brown';
  
Exec PR_Q3('Dave','Brown');

Select INVOICE_NUMBER, MEMBER_NUMBER, INVOICE_DATE 
  From RENTAL_INVOICE
    Where trunc(INVOICE_DATE) = trunc(SYSDATE) and MEMBER_NUMBER = 
      (Select MEMBER_NUMBER
         FROM MEMBER
          Where First_Name = 'Dave' And LAST_NAME = 'Brown');
------------------------- ------------------------------ -------------
FIRST_NAME                LAST_NAME                      MEMBER_NUMBER
------------------------- ------------------------------ -------------
Dave                      Brown                                    120 
------------------------- ------------------------------ -------------
anonymous block completed
------------------------- ------------------------------ -------------
INVOICE_NUMBER MEMBER_NUMBER INVOICE_DATE
-------------- ------------- ------------
         25703           120 14-10-15  
------------------------- ------------------------------ -------------

--Q4
--Test a-1.
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where M.FIRST_NAME = 'Jumbo' And M.LAST_NAME = 'Chiang';

Select PKG_Q4.FN_Q4('Jumbo', 'Chiang')
  From dual;
--------------------------------------------------------
no rows selected
--------------------------------------------------------
PKG_Q4.FN_Q4('JUMBO','CHIANG')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
--------------------------------------------------------
Error! The member Jumbo, Chiang does not exist! 
--------------------------------------------------------

--Test a-2.
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where M.MEMBER_NUMBER = 1000;
      
Select PKG_Q4.FN_Q4(1000)
  From dual;
-------------------------------------------
no rows selected
-------------------------------------------
PKG_Q4.FN_Q4(1000)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
-------------------------------------------
Error! The member 1000 does not exist!
-------------------------------------------

--Test b.
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where M.FIRST_NAME = 'Ivan' And M.LAST_NAME = 'Kent';

Select PKG_Q4.FN_Q4('Ivan', 'Kent')
  From dual;
------------- ------------------------- ------------------------------ -------------- ------------ --------------- -------------
MEMBER_NUMBER FIRST_NAME                LAST_NAME                      INVOICE_NUMBER INVOICE_DATE RENTAL_DURATION DATE_RETURNED
------------- ------------------------- ------------------------------ -------------- ------------ --------------- -------------
          900 Ivan                      Kent                                     2000 13-06-05                   2 14-06-03           
          200 Ivan                      Kent                                    15596 13-08-20                   7 13-08-23      
------------- ------------------------- ------------------------------ -------------- ------------ --------------- -------------
PKG_Q4.FN_Q4('IVAN','KENT')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
------------- ------------------------- ------------------------------ -------------- ------------ --------------- -------------
Error! Ivan, Kent is not unique!
------------- ------------------------- ------------------------------ -------------- ------------ --------------- -------------

--Test c.     
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED, RID.OVERDUE_PAID_YN 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where M.FIRST_NAME = 'Ivan' And M.LAST_NAME = 'Kent'
              And Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration 
              And Overdue_Paid_YN = 'Y';

Select PKG_Q4.FN_Q4('Dave', 'Brown')
  From dual;
  
Select PKG_Q4.FN_Q4(200)
  From dual;
--------------------------------------------------------------------------------------------
no rows selected
--------------------------------------------------------------------------------------------
PKG_Q4.FN_Q4('DAVE','BROWN')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
--------------------------------------------------------------------------------------------
The Member with member number     120, Named: Dave, Brown has No outstanding rental invoice!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
--------------------------------------------------------------------------------------------
PKG_Q4.FN_Q4(200)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
--------------------------------------------------------------------------------------------
The Member with member number     200, Named: Ivan, Kent has No outstanding rental invoice!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
--------------------------------------------------------------------------------------------

--Test d.             
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED, RID.OVERDUE_PAID_YN 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where M.FIRST_NAME = 'Winnifred' And M.LAST_NAME = 'Woods'
        And Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration 
        And Overdue_Paid_YN = 'Y';

Select PKG_Q4.FN_Q4('Winnifred', 'Woods')
  From dual;
  
Select PKG_Q4.FN_Q4(540)
  From dual;
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
MEMBER_NUMBER FIRST_NAME                LAST_NAME                      INVOICE_NUMBER INVOICE_DATE RENTAL_DURATION DATE_RETURNED OVERDUE_PAID_YN
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
          540 Winnifred                 Woods                                   15595 13-07-08                   2 13-07-11      Y               

PKG_Q4.FN_Q4('WINNIFRED','WOODS')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The Member with member number     540, Named: Winnifred, Woods has outstanding rental invoice numbers as following:  15595                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
PKG_Q4.FN_Q4(540)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The Member with member number     540, Named: Winnifred, Woods has outstanding rental invoice numbers as following:  15595  
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------

--Q5
--Test a Over 3 Outstanding records.
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED, RID.OVERDUE_PAID_YN 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration 
              And M.MEMBER_NUMBER = 470
              And Overdue_Paid_YN = 'Y';

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(Seq_Invoice.NextVal, 470, Sysdate);
  
Select INVOICE_NUMBER, MEMBER_NUMBER, INVOICE_DATE
  From Rental_Invoice
    Where MEMBER_NUMBER = 470;
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
MEMBER_NUMBER FIRST_NAME                LAST_NAME                      INVOICE_NUMBER INVOICE_DATE RENTAL_DURATION DATE_RETURNED OVERDUE_PAID_YN
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
          470 Minnie                    Ono                                     80300 14-09-04                   1 14-09-30      Y               
          470 Minnie                    Ono                                     80301 14-09-04                   1 14-09-30      Y               
          470 Minnie                    Ono                                     80302 14-09-04                   1 14-09-30      Y               
          470 Minnie                    Ono                                     80303 14-09-04                   1 14-09-30      Y               
          470 Minnie                    Ono                                     20111 13-10-14                   1 13-10-17      Y               
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
Error starting at line : 245 in command -
Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(Seq_Invoice.NextVal, 470, Sysdate)
Error report -
SQL Error: ORA-20100: The member cannot rent any more with over 5 overdue or over 3 outstanding records!
ORA-06512: at "ORCL5_04.TR_Q5", line 25
ORA-04088: error during execution of trigger 'ORCL5_04.TR_Q5'
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
INVOICE_NUMBER MEMBER_NUMBER INVOICE_DATE
-------------- ------------- ------------
         15593           470 13-06-13     
         20111           470 13-10-14         
         25593           470 14-06-14     
         80300           470 14-09-04     
         80301           470 14-09-04     
         80302           470 14-09-04     
         80303           470 14-09-04     
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------

--Test b Over 5 OverDue records.
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED, RID.OVERDUE_PAID_YN 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration 
              And M.MEMBER_NUMBER = 500
              And Overdue_Paid_YN = 'N';

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(Seq_Invoice.NextVal, 500, Sysdate);
  
Select INVOICE_NUMBER, MEMBER_NUMBER, INVOICE_DATE
  From Rental_Invoice
    Where MEMBER_NUMBER = 500;
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
MEMBER_NUMBER FIRST_NAME                LAST_NAME                      INVOICE_NUMBER INVOICE_DATE RENTAL_DURATION DATE_RETURNED OVERDUE_PAID_YN
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
          500 Robert                    Smith                                   15587 13-06-06                   1 13-06-09      N               
          500 Robert                    Smith                                   90100 14-09-04                   1 14-09-30      N               
          500 Robert                    Smith                                   90101 14-09-04                   1 14-09-30      N               
          500 Robert                    Smith                                   90102 14-09-04                   1 14-09-30      N               
          500 Robert                    Smith                                   90103 14-09-04                   1 14-09-30      N               
          500 Robert                    Smith                                   90104 14-09-04                   1 14-09-30      N               
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
Error starting at line : 292 in command -
Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(Seq_Invoice.NextVal, 500, Sysdate)
Error report -
SQL Error: ORA-20100: The member cannot rent any more with over 5 overdue or over 3 outstanding records!
ORA-06512: at "ORCL5_04.TR_Q5", line 25
ORA-04088: error during execution of trigger 'ORCL5_04.TR_Q5'
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
INVOICE_NUMBER MEMBER_NUMBER INVOICE_DATE
-------------- ------------- ------------    
         15587           500 13-06-06       
         25589           500 14-06-09     
         25596           500 14-08-21     
         90100           500 14-09-04     
         90101           500 14-09-04     
         90102           500 14-09-04     
         90103           500 14-09-04     
         90104           500 14-09-04     
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
 
--Test c No violation  
Select M.Member_Number, M.FIRST_NAME, M.LAST_NAME, RI.INVOICE_NUMBER, RI.INVOICE_DATE, RID.RENTAL_DURATION ,RID.DATE_RETURNED, RID.OVERDUE_PAID_YN 
  From Rental_Invoice RI 
    LEFT OUTER JOIN Rental_Invoice_Detail RID On RID.Invoice_Number = RI.Invoice_Number
    LEFT OUTER JOIN MEMBER M On RI.MEMBER_NUMBER = M.MEMBER_NUMBER
      Where Trunc(Date_Returned) > Trunc(Invoice_Date) + Rental_Duration 
              And M.MEMBER_NUMBER = 100;
    
Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(Seq_Invoice.NextVal, 100, Sysdate); 

Select INVOICE_NUMBER, MEMBER_NUMBER, INVOICE_DATE
  From Rental_Invoice
    Where MEMBER_NUMBER = 100;
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
MEMBER_NUMBER FIRST_NAME                LAST_NAME                      INVOICE_NUMBER INVOICE_DATE RENTAL_DURATION DATE_RETURNED OVERDUE_PAID_YN
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
          100 Randy                     Sims                                    15577 13-05-21                   1 13-05-24      N               
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
1 rows inserted.
------------- ------------------------- ------------------------------ -------------- ------------ --------------- ------------- ---------------
INVOICE_NUMBER MEMBER_NUMBER INVOICE_DATE
-------------- ------------- ------------    
         25701           100 14-10-15     
         25706           100 14-10-15     
         25707           100 14-10-15    
---------------END-------------------------
