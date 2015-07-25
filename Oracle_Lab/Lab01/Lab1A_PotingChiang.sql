-- LAB_01_A-Q1:

CREATE TABLE Member (
  Member_Number NUMBER(6,0) 
    CONSTRAINT  PK_MemberNum  PRIMARY KEY
    CONSTRAINT  NNL_MemberNum NOT NULL,
  First_Name  VARCHAR2(25)
    CONSTRAINT  NNL_MemberFName NOT NULL,
  Last_Name VARCHAR2(30)
    CONSTRAINT  NNL_MemberLName NOT NULL,
  Area_Code NUMBER(3,0) -- Yes
    DEFAULT 780 
    CONSTRAINT CK_MemberAreaCode3Digit CHECK( REGEXP_LIKE(Area_Code, '\d{3}') )
    CONSTRAINT NL_MemberAreaCode NULL,
  Phone_Number NUMBER(7,0)
    CONSTRAINT NL_MemberPhoneNum NULL,
  Street_Address VARCHAR2(35)
    CONSTRAINT NL_MemberStreet NULL,
  City VARCHAR2(25)
    CONSTRAINT NL_MemberCity NULL,
  Province CHAR(2)
    DEFAULT 'AB'
    CONSTRAINT CK_MemberProvinceUpperCase CHECK( REGEXP_LIKE (Province, '[A-Z]{2}') )
    CONSTRAINT NL_MemberProvince NULL,
  Postal_Code CHAR(6) 
    CONSTRAINT NL_MemberPCode NULL,
  Email_Address VARCHAR2(129) 
    CONSTRAINT NNL_MemberEmail NOT NULL,
  Membership_Date DATE
    DEFAULT SYSDATE
    CONSTRAINT NNL_MemberDate NOT NULL,
  Current_Status_YN CHAR(1)
    DEFAULT 'Y'
    CONSTRAINT CK_MemberCStatusYN CHECK( Current_Status_YN IN ('Y', 'N') )
    CONSTRAINT NNL_MemberCurrentStatus NOT NULL
);

CREATE TABLE Rental_Invoice (

  Invoice_Number NUMBER(5,0)
    CONSTRAINT PK_RentalInvoiceNum PRIMARY KEY 
    CONSTRAINT NNL_RentalInvoiceNum NOT NULL,
  Member_Number NUMBER(6,0)
    CONSTRAINT FK_RentalInvoiceMemberNumber REFERENCES Member(Member_Number)
    CONSTRAINT NNL_RentalInvoiceMemberNumber NOT NULL,
  Invoice_Date DATE 
    DEFAULT SYSDATE
    CONSTRAINT NNL_RentalInvoiceDate NOT NULL   
);

CREATE TABLE Supplier (

  Supplier_Number NUMBER(4,0)
    CONSTRAINT PK_SupplierNum PRIMARY KEY
    CONSTRAINT NNL_SupplierNum NOT NULL,
  Supplier_Name VARCHAR2 (50)
    CONSTRAINT NNL_SupplierName NOT NULL,
  Active_YN CHAR(1)
    DEFAULT 'Y'
    CONSTRAINT CK_SupplierActiveYN CHECK( Active_YN IN ('Y', 'N') )
    CONSTRAINT NNL_SupplierActiveYN NOT NULL
);

CREATE TABLE Special_Order_Item (

  Item_Number NUMBER(6,0) 
    CONSTRAINT PK_SpecialOrderItemNum PRIMARY KEY
    CONSTRAINT NNL_SpecialOrderItemNum NOT NULL,
  Description VARCHAR2(80) 
    CONSTRAINT NNL_SpecialOrderItemDes NOT NULL,
  Item_Cost NUMBER(7,2)
    CONSTRAINT CK_SpecialOrderItemCost CHECK( Item_Cost > 0 )
    CONSTRAINT NL_SpecialOderItemCost NULL
);

CREATE TABLE Rental_Item (

  Rental_Item_Number NUMBER(4,0)
    CONSTRAINT PK_RentalItemNum PRIMARY KEY
    CONSTRAINT NNL_RentalItemNum NOT NULL,
  Supplier_Number NUMBER(4,0)
    CONSTRAINT FK_RentalItemSupplierNum REFERENCES Supplier(Supplier_Number)
    CONSTRAINT NNL_RentalItemSupplierNum NOT NULL,
  Description VARCHAR2(80) 
    CONSTRAINT NNL_RentalItemDes NOT NULL,
  Rental_Duration NUMBER(2,0)
    CONSTRAINT CK_RentalItemDuration CHECK ( Rental_Duration >= 0 ) -- Yes, it belongs to quantity.
    CONSTRAINT NNL_RentalItemDuration NOT NULL,
  Rental_Rate NUMBER(4,2)
    DEFAULT 4.40
    CONSTRAINT CK_RentalItemRate CHECK ( Rental_Rate > 0 )
    CONSTRAINT NNL_RentalItemRate NOT NULL,
  Overdue_Rental_Rate NUMBER(4,2)
    DEFAULT 3.83
    CONSTRAINT CK_RentalItemOverdueRate CHECK ( Overdue_Rental_Rate > 0 )
    CONSTRAINT NNL_RentalItemOverdueRate NOT NULL
);

CREATE TABLE Rental_Item_Copy (

  Bar_Code CHAR(8)
    CONSTRAINT PK_RentalItemCopyBarCode PRIMARY KEY
    CONSTRAINT CK_RentalItemCopyBarCode CHECK( REGEXP_LIKE( Bar_Code, '[1-9]{1}[0-9]{3}-[0-9]{2}[1-9]{1}' ) )
    CONSTRAINT NNL_RentalItemCopyBarCode NOT NULL,
  Rental_Item_Number NUMBER(4,0)
    CONSTRAINT FK_RentalItemCopyRentalItemNum REFERENCES Rental_Item (Rental_Item_Number)
    CONSTRAINT NNL_RentalItemCopyNum NOT NULL,
  Purchase_Cost NUMBER(6,2)
    CONSTRAINT CK_RentalItemCopyPurchaseCost CHECK( Purchase_Cost > 0 )
    CONSTRAINT NL_RentalItemCopyPurchaseCost NULL
);

CREATE TABLE Special_Order (

  Order_Number NUMBER(8,0)
    CONSTRAINT PK_SpecialOrderNum PRIMARY KEY
    CONSTRAINT NNL_SpecialOrderNum NOT NULL,
  Member_Number NUMBER(6,0)
    CONSTRAINT FK_SpecialOrderMemberNum REFERENCES Member (Member_Number)
    CONSTRAINT NNL_SpecialOrderMemberNum NOT NULL,
  Order_Date DATE
    DEFAULT SYSDATE
    CONSTRAINT NNL_SpecialOrderDate NOT NULL,
  Received_Date DATE
    DEFAULT SYSDATE
    CONSTRAINT NL_SpecialOrderRecDate NULL,
  Picked_Up_Date DATE
    DEFAULT SYSDATE
    CONSTRAINT NL_SpecialOrderPickDate NULL,
    
    CONSTRAINT CK_SpecialOrderPickDate CHECK (Picked_Up_Date > Received_Date)
);

CREATE TABLE Special_Order_Detail (

  Order_Number NUMBER(8,0)
    CONSTRAINT FK_SpecialOrderDetailOrderNum REFERENCES Special_Order (Order_Number)
    CONSTRAINT NNL_SpecialOrderDetailOrderNum NOT NULL,
  Item_Number NUMBER(6,0)
    CONSTRAINT FK_SpecialOrderDetailItemNum REFERENCES Special_Order_Item (Item_Number)
    CONSTRAINT NNL_SpecialOrderDetailItemNum NOT NULL,
  Quantity NUMBER(5,0) 
    CONSTRAINT CK_SpecialOrderDetailQty CHECK ( Quantity >= 0 )
    CONSTRAINT NNL_SpecialOrderDetailQty NOT NULL,
  Sales_Price NUMBER(7,2)
    CONSTRAINT CK_SpecialOrderDetailSPrice CHECK ( Sales_Price > 0 )
    CONSTRAINT NNL_SpecialOrderDetailSPrice NOT NULL,
    
    CONSTRAINT PK_SpecialOrderDetail PRIMARY KEY ( Order_Number, Item_Number )
);

CREATE TABLE Rental_Invoice_Detail (
  Invoice_Number NUMBER(5,0)
    CONSTRAINT FK_RentalInvoiceDetailNum REFERENCES Rental_Invoice (Invoice_Number)
    CONSTRAINT NNL_RentalInvoiceDetailNum NOT NULL,
  Bar_Code CHAR(8)
    CONSTRAINT FK_RentInvDetailCopyBCode REFERENCES Rental_Item_Copy (Bar_Code)
    CONSTRAINT CK_RentInvDetailBCode CHECK( REGEXP_LIKE( Bar_Code, '[1-9]{1}[0-9]{3}-[0-9]{2}[1-9]{1}' ) )
    CONSTRAINT NNL_RentInvDetailBCode NOT NULL,
  Date_Returned DATE
    DEFAULT SYSDATE
    CONSTRAINT NL_RentalInvoiceDetailReDate NULL,
  Rental_Duration NUMBER(2,0)
    CONSTRAINT CK_RentInvDetailD CHECK ( Rental_Duration >= 0 ) -- Yes. It belongs to quantity.
    CONSTRAINT NNL_RentInvDetailD NOT NULL,
  Original_Rental_Rate NUMBER(4,2)
    DEFAULT 4.40
    CONSTRAINT CK_RentInvDetailRentRate CHECK (  Original_Rental_Rate > 0 )
    CONSTRAINT NNL_RentInvDetailRentRate NOT NULL,
  Overdue_Paid_YN CHAR(1)
    DEFAULT 'N'
    CONSTRAINT CK_RentInvDetailOverDPaidYN CHECK ( Overdue_Paid_YN IN ('Y', 'N') )
    CONSTRAINT NL_RentInvDetailOverDPaidYN NULL,
  Overdue_Rental_Rate NUMBER(4,2)
    DEFAULT 3.83
    CONSTRAINT CK_RentInvDetailOverDRentRate CHECK ( Overdue_Rental_Rate > 0 )
    CONSTRAINT NL_RentInvDetailOverDRentRate NULL,
    
    CONSTRAINT PK_RentalInvoiceDetail PRIMARY KEY ( Invoice_Number, Bar_Code )
);

-- LAB_01_A-Q2:

CREATE SEQUENCE Seq_Invoice 
  START WITH 25700
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE Seq_Item 
  START WITH 9000
  INCREMENT BY 100
  NOCACHE;

CREATE SEQUENCE Seq_Member 
  START WITH 750
  INCREMENT BY 10
  NOCACHE;

CREATE SEQUENCE Seq_Order
  START WITH 500
  INCREMENT BY 5
  NOCACHE;







