-- delete all existing data
Delete From Rental_Invoice_Detail;
Delete From Special_Order_Detail;
Delete From Rental_Item_Copy;
Delete From Rental_Invoice;
Delete From Special_Order;
Delete From Special_Order_Item;
Delete From Rental_Item;
Delete From Supplier;
Delete From Member;

Drop Sequence Seq_Invoice;
Drop Sequence Seq_Item;
Drop Sequence Seq_Member;
Drop Sequence Seq_Order;

-- Member Data
Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(120, 'Brown', 'Dave', 780, 4861122, '11206 106 ST.', 'Edmonton', 'AB', 'T3E2E2', 'slugger@shinney.com', To_Date('05-Oct-2012', 'DD-Mon-YYYY'), 'Y');      

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(100, 'Sims', 'Randy', 780, 3760577, '172 Downers Grove', 'Didsbury', 'AB', 'T9E2V4', 'randy@simcity.org', To_Date('08-Apr-2013', 'DD-Mon-YYYY'), 'Y');    

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(320, 'Brown', 'Thomas', 780, 3711029, '11206 Empire Building', 'Edmonton', 'AB', 'T7S2K0', 'pipes@plumbing.ab.ca', To_Date('14-Oct-2013', 'DD-Mon-YYYY'), 'Y');               

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(400, 'Kowalski', 'Stan', 780, 2861577, '172 Downing St.', 'Fort Saskatchewan', 'AB', 'T1Q2S3', 'stella@cars.com', To_Date('14-Mar-2013', 'DD-Mon-YYYY'), 'Y');                

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(220, 'Petroni', 'Joseph', 780, 3751133, '11206 Red Street', 'Redwater', 'AB', 'T3P9F3', 'joep@soccer.com', To_Date('10-Nov-2012', 'DD-Mon-YYYY'), 'Y');   

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(700, 'Munsch', 'Robert', 780, 9880388, 'BOX 561', 'Athabasca', 'AB', 'T3E4S2', 'bobbym@athab.ca', To_Date('03-Dec-2013', 'DD-Mon-YYYY'), 'Y');            

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(540, 'Woods', 'Winnifred', 403, 2824444, '200 3 ST. S.W.', 'Calgary', 'AB', 'T2D8D8', 'ww@not_www.org', To_Date('16-Jul-2014', 'DD-Mon-YYYY'), 'Y');      

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(620, 'Pan', 'Peter', 780, 3863333, 'Fantasy Land', 'Edmonton', 'AB', 'T5M4N2', 'tinkerboy@neverland.org', To_Date('13-Jun-2013', 'DD-Mon-YYYY'), 'Y');    

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(730, 'Smith', 'Jay', 780, 2731216, 'BOX 761', 'Red Deer', 'AB', 'T3S5W6', 'j_dog@anonymous.ca', To_Date('06-Feb-2013', 'DD-Mon-YYYY'), 'N');              

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(470, 'Ono', 'Minnie', 780, 2561203, '12003 103 ST.', 'Edmonton', 'AB', 'T7D2W2', 'smallone@beat.org', To_Date('15-Jun-2013', 'DD-Mon-YYYY'), 'Y');        

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(500, 'Smith', 'Robert', 780, 9863201, 'BOX 333', 'Leduc', 'AB', 'T4W5C3', 'bob@anonymous.ca', To_Date('06-Aug-2013', 'DD-Mon-YYYY'), 'Y');                

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(200, 'Kent', 'Ivan', 780, 4891256, '11044 83 ST.', 'Edmonton', 'AB', 'T6M7G2', 'kivan@kayak.org', To_Date('17-May-2014', 'DD-Mon-YYYY'), 'Y');            

Insert into Member             
	(member_number, last_name, first_name, area_code, phone_number, street_address, city, province, postal_code, email_address, membership_date, current_status_yn)                
values     
	(250, 'Kent', 'Dennis', 780, 4892909, '11044 83 ST.', 'Edmonton', 'AB', 'T6M7G2', 'dkent@united.ca', To_Date('08-Sep-2014', 'DD-Mon-YYYY'), 'Y');          

-- Supplier Data

Insert into Supplier
	(Supplier_Number, Supplier_Name, Active_YN)
values
	(2350, 'Better Than Good Buy', 'Y');

Insert into Supplier
	(Supplier_Number, Supplier_Name, Active_YN)
values
	(2975, 'Not Here Yet Distrubutors', 'N');

Insert into Supplier
	(Supplier_Number, Supplier_Name, Active_YN)
values
	(2475, 'Sometime Soon Shop', 'Y');

Insert into Supplier
	(Supplier_Number, Supplier_Name, Active_YN)
values
	(2725, 'Sony', 'Y');

Insert into Supplier
	(Supplier_Number, Supplier_Name, Active_YN)
values
	(2850, 'JVC', 'Y');

Insert into Supplier
	(Supplier_Number, Supplier_Name, Active_YN)
values
	(2600, 'Microsoft', 'Y');


-- Rental Items

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(1000, 2600, 'Microsoft X-BOX 360', 1, 26.99, 15.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(1100, 2725, 'Sony PlayStation 2', 1, 16.99, 12.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(4700, 2350, 'The 40-Year-Old Virgin', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(1400, 2850, 'DVD / VCR Combination', 1, 22.75, 17);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(2210, 2475, 'Fun With Dick and Jane', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(2220, 2350, 'Deep Blue', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(2230, 2475, 'King Kong', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(2240, 2350, 'Memoirs of a Geisha', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(2500, 2475, 'Six Feet Under: Season 5', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3010, 2350, 'Harry Potter and the Goblet of Fire', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3200, 2350, 'Walk the Line', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3100, 2350, 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3600, 2475, 'King Kong', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3300, 2475, 'Batman Begins', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3500, 2350, '24: Season 4', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(7300, 2600, 'XBOX: Brothers in Arms: Road to Hill 30', 2, 5.27, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3900, 2350, 'Rent', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(4100, 2350, 'Crash', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(4300, 2475, 'Clerks', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(1200, 2600, 'Microsoft X-BOX Console', 1, 17.99, 13.5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(4500, 2475, 'Wallace and Gromit: The Curse of the Were-Rabbit', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(4900, 2350, 'Mr. and Mrs. Smith', 2, 4.27, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(5000, 2350, 'National Treasure', 1, 4.99, 3.83);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(5300, 2475, 'Hitch', 1, 4.99, 3.83);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(5400, 2350, 'The Interpreter', 1, 4.99, 3.83);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(5500, 2475, 'The Notebook', 1, 4.99, 3.83);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(5600, 2475, 'Million Dollar Baby', 1, 4.99, 3.83);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(8300, 2725, 'PS2: Madden NFL 2006', 2, 4.75, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(6100, 2600, 'XBOX 360: Need For Speed: Most Wanted', 2, 4.99, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(6200, 2600, 'XBOX 360: Project Gotham Racing 3', 2, 4.99, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(6400, 2600, 'XBOX 360: King Kong (Peter Jackson)', 2, 4.99, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(7000, 2600, 'XBOX: Grand Theft Auto: San Andreas', 2, 5.27, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(7100, 2600, 'XBOX: Midnight Club 3: DUB Edition', 2, 5.27, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(3440, 2350, 'Star Wars Episode III: Revenge of the Sith', 7, 3.75, .5);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(6000, 2600, 'XBOX 360: Call of Duty 2', 2, 4.99, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(7200, 2600, 'XBOX: Star Wars Episode III: Revenge of the Sith', 2, 5.27, 2);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(8000, 2725, 'PS2: Midnight Club 3: DUB Edition', 2, 4.75, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(1300, 2850, 'DVD Player', 1, 15.99, 12);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(8100, 2725, 'PS2: Gran Turismo 4', 2, 4.75, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(8200, 2725, 'PS2: Destroy All Humans!', 2, 4.75, 1.75);

Insert into Rental_Item
	(rental_item_number, supplier_number, description, rental_duration, rental_rate, overdue_rental_rate)
values
	(6300, 2600, 'XBOX 360: Condemned: Criminal Origins', 2, 4.99, 2);


-- Rental Item Copy

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1000-001', 1000, 200);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1000-002', 1000, 200);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1000-003', 1000, 200);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1100-001', 1100, 159);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1100-002', 1100, 159);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1100-003', 1100, 159);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1200-001', 1200, 300);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1200-002', 1200, 300);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1300-001', 1300, 290);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1300-002', 1300, 290);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1400-001', 1400, 390);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('1400-002', 1400, 390);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-001', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-002', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-005', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-006', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-007', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2220-001', 2220, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2220-002', 2220, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-001', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-002', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-003', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-004', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-005', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-006', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-007', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-008', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-009', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-010', 2230, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-011', 2230, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2230-012', 2230, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-003', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2210-004', 2210, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2240-001', 2240, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2240-002', 2240, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2500-001', 2500, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2500-002', 2500, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2500-003', 2500, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2500-004', 2500, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('2500-005', 2500, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-001', 3010, 18);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-002', 3010, 18);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-003', 3010, 18);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-004', 3010, 18);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-005', 3010, 18);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-006', 3010, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-007', 3010, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-008', 3010, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3010-009', 3010, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3200-001', 3200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3200-002', 3200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3200-003', 3200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7100-002', 7100, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7100-003', 7100, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3600-002', 3600, 12);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3600-003', 3600, 12);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3600-004', 3600, 12);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3600-005', 3600, 12);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3300-001', 3300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3300-002', 3300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3300-003', 3300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3300-004', 3300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3440-001', 3440, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3440-004', 3440, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3440-005', 3440, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3440-006', 3440, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3440-007', 3440, 28);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3500-002', 3500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3500-003', 3500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3900-001', 3900, 19);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3900-002', 3900, 19);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3900-003', 3900, 19);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3900-004', 3900, 19);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3900-005', 3900, 19);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4100-001', 4100, 50);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4300-002', 4300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4300-004', 4300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4300-005', 4300, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4500-001', 4500, 30);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3100-001', 3100, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('3600-001', 3600, 12);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4500-002', 4500, 30);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4500-003', 4500, 30);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4500-004', 4500, 30);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-001', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-002', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-003', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-004', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-005', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-006', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-007', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-008', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4700-009', 4700, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('4900-001', 4900, 50);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5000-001', 5000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5000-002', 5000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5000-004', 5000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5000-005', 5000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5000-006', 5000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5300-001', 5300, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5300-002', 5300, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-001', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-002', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-003', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-004', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-005', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-008', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-009', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5500-001', 5500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5500-002', 5500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5500-004', 5500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5500-005', 5500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5500-006', 5500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5500-008', 5500, 20);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-001', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-002', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-003', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-004', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-005', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-006', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6000-007', 6000, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6100-001', 6100, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6100-002', 6100, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6100-003', 6100, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6100-006', 6100, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6100-007', 6100, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6200-001', 6200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6200-002', 6200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6200-003', 6200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6200-004', 6200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6200-005', 6200, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-006', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('5400-007', 5400, 10);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6300-001', 6300, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6300-002', 6300, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6300-003', 6300, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6300-004', 6300, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('6300-005', 6300, 15);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7000-001', 7000, 56.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7000-002', 7000, 56.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7100-001', 7100, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7100-004', 7100, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7200-001', 7200, 49.56);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7200-002', 7200, 49.56);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7200-003', 7200, 49.56);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7300-001', 7300, 29.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7300-002', 7300, 29.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7300-003', 7300, 29.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7300-004', 7300, 29.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('7300-005', 7300, 29.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8000-001', 8000, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8000-002', 8000, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8000-003', 8000, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8000-004', 8000, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8000-005', 8000, 72.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8100-001', 8100, 49.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8100-002', 8100, 49.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8200-001', 8200, 29.56);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8300-001', 8300, 59.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8300-003', 8300, 59.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8300-004', 8300, 59.99);

Insert into Rental_Item_Copy
	(bar_code, rental_item_number, purchase_cost)
values
	('8300-005', 8300, 59.99);


-- Rental Invoice Data

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15576, 100, To_Date('14-May-2013 12:40:17', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15577, 100, To_Date('21-May-2013 11:20:39', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15578, 700, To_Date('24-May-2013 09:32:06', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15579, 400, To_Date('31-May-2013 11:18:35', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15580, 120, To_Date('03-Jun-2013 18:39:01', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15581, 700, To_Date('04-Jun-2013 15:43:53', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15582, 120, To_Date('05-Jun-2013 14:12:58', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15583, 320, To_Date('05-Jun-2013 08:47:54', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15584, 500, To_Date('05-Jun-2013 15:06:12', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15585, 120, To_Date('06-Jun-2013 15:57:25', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15586, 220, To_Date('06-Jun-2013 18:39:38', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15587, 500, To_Date('06-Jun-2013 11:47:16', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15588, 500, To_Date('07-Jun-2013 12:56:55', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15589, 500, To_Date('08-Jun-2013 16:42:12', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15590, 700, To_Date('08-Jun-2013 12:12:03', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15591, 120, To_Date('10-Jun-2013 15:08:28', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15592, 220, To_Date('11-Jun-2013 17:55:03', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15593, 470, To_Date('13-Jun-2013 13:36:53', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15594, 500, To_Date('14-Jun-2013 13:54:45', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15595, 540, To_Date('08-Jul-2013 14:49:18', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15596, 200, To_Date('20-Aug-2013 09:51:12', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15597, 700, To_Date('23-Aug-2013 17:32:06', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15598, 540, To_Date('30-Aug-2013 18:11:36', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15599, 700, To_Date('01-Sep-2013 19:15:26', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(15600, 700, To_Date('03-Sep-2013 09:51:24', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20100, 120, To_Date('05-Sep-2013 08:35:54', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20101, 320, To_Date('05-Sep-2013 13:22:02', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20102, 200, To_Date('06-Oct-2013 11:57:33', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20103, 120, To_Date('07-Oct-2013 12:14:34', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20104, 220, To_Date('07-Oct-2013 13:43:37', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20105, 500, To_Date('07-Oct-2013 15:23:49', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20106, 500, To_Date('08-Oct-2013 09:22:16', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20107, 500, To_Date('09-Oct-2013 11:12:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20108, 700, To_Date('09-Oct-2013 16:31:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20109, 120, To_Date('11-Oct-2013 19:50:47', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20110, 220, To_Date('12-Oct-2013 13:24:12', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20111, 470, To_Date('14-Oct-2013 18:48:17', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20112, 200, To_Date('15-Oct-2013 17:42:47', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20113, 320, To_Date('15-Oct-2013 18:22:07', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20114, 470, To_Date('21-Oct-2013 17:07:16', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20115, 120, To_Date('21-Oct-2013 17:25:33', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20210, 120, To_Date('04-Nov-2013 13:04:37', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20211, 320, To_Date('04-Nov-2013 16:22:05', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20212, 200, To_Date('04-Nov-2013 17:39:07', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20303, 120, To_Date('05-Nov-2013 11:18:13', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20304, 220, To_Date('06-Dec-2013 18:39:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20315, 500, To_Date('06-Dec-2013 17:07:04', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20406, 500, To_Date('07-Dec-2013 18:11:25', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20407, 500, To_Date('08-Dec-2013 13:25:44', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20438, 700, To_Date('07-Jan-2014 19:52:28', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20549, 250, To_Date('09-Jan-2014 14:59:36', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20650, 220, To_Date('10-Jan-2014 19:05:34', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20711, 470, To_Date('12-Feb-2014 20:35:13', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(20812, 200, To_Date('13-Feb-2014 18:11:04', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(21213, 320, To_Date('15-Mar-2014 11:07:07', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(22114, 470, To_Date('05-Apr-2014 14:36:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(22115, 120, To_Date('05-Apr-2014 10:36:28', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23100, 120, To_Date('06-Apr-2014 10:37:17', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23101, 320, To_Date('06-Apr-2014 16:09:49', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23102, 200, To_Date('06-Apr-2014 12:21:55', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23203, 120, To_Date('07-Apr-2014 09:13:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23304, 220, To_Date('07-Apr-2014 16:40:43', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23305, 500, To_Date('07-Apr-2014 16:17:52', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23506, 500, To_Date('08-Apr-2014 13:41:50', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23617, 500, To_Date('09-Apr-2014 13:02:13', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23618, 700, To_Date('09-Apr-2014 10:21:47', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23809, 120, To_Date('11-Apr-2014 17:34:02', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(23900, 220, To_Date('12-Apr-2014 10:05:30', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(24111, 470, To_Date('14-Apr-2014 17:12:08', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(24212, 200, To_Date('15-Apr-2014 13:14:25', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(24213, 320, To_Date('15-Apr-2014 14:05:47', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(24414, 470, To_Date('21-Apr-2014 15:32:51', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(24415, 120, To_Date('21-Apr-2014 17:55:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25576, 100, To_Date('15-May-2014 20:52:18', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25577, 100, To_Date('22-May-2014 10:34:37', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25578, 700, To_Date('25-May-2014 16:18:57', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25579, 540, To_Date('01-Jun-2014 09:27:42', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25580, 120, To_Date('04-Jun-2014 18:30:25', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25581, 700, To_Date('05-Jun-2014 13:49:24', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25582, 120, To_Date('06-Jun-2014 14:07:53', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25583, 320, To_Date('06-Jun-2014 10:09:21', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25584, 500, To_Date('06-Jun-2014 16:56:14', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25585, 120, To_Date('07-Jun-2014 16:13:56', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25586, 220, To_Date('07-Jun-2014 15:09:14', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25587, 500, To_Date('07-Jun-2014 09:57:09', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25588, 500, To_Date('08-Jun-2014 16:51:22', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25589, 500, To_Date('09-Jun-2014 13:48:39', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25590, 700, To_Date('09-Jun-2014 18:17:42', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25591, 120, To_Date('11-Jun-2014 18:54:53', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25592, 220, To_Date('12-Jun-2014 10:03:38', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25593, 470, To_Date('14-Jun-2014 17:54:06', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25594, 200, To_Date('15-Jun-2014 16:38:49', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25595, 100, To_Date('14-Aug-2014 14:53:46', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25596, 500, To_Date('21-Aug-2014 15:14:25', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25597, 700, To_Date('24-Aug-2014 10:10:26', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25598, 540, To_Date('31-Aug-2014 18:29:21', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25599, 700, To_Date('02-Sep-2014 17:52:38', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Rental_Invoice
	(invoice_number, member_number, invoice_date)
values
	(25600, 700, To_Date('04-Sep-2014 08:19:23', 'DD-Mon-YYYY HH24:MI:SS'));   

-- Rental Invoice Detail

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25579, '6000-002', To_Date('03-Jun-2014 15:57:04', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25579, '6200-004', To_Date('03-Jun-2014 11:50:58', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25579, '6300-002', To_Date('03-Jun-2014 18:27:08', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25579, '3500-003', To_Date('03-Jun-2014 08:17:46', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25580, '3010-001', To_Date('05-Jun-2014 09:36:51', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25581, '3600-001', To_Date('06-Jun-2014 19:13:06', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25581, '2230-005', To_Date('10-Jun-2014 17:38:56', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25584, '2240-002', To_Date('', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25584, '3200-002', To_Date('13-Jun-2014 09:40:45', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25584, '2230-001', To_Date('13-Jun-2014 09:35:46', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25585, '2240-001', To_Date('', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25586, '2230-004', To_Date('11-Jun-2014 14:14:22', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25586, '8000-002', To_Date('09-Jun-2014 08:22:52', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25586, '8300-001', To_Date('09-Jun-2014 10:56:29', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25587, '8300-003', To_Date('09-Jun-2014 18:23:21', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25587, '7300-003', To_Date('09-Jun-2014 19:36:30', 'DD-Mon-YYYY HH24:MI:SS'), 2, 10.54, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25588, '8000-001', To_Date('10-Jun-2014 10:15:45', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25589, '8300-004', To_Date('11-Jun-2014 11:45:41', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25590, '3300-003', To_Date('11-Jun-2014 13:32:30', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25590, '6000-001', To_Date('11-Jun-2014 15:07:59', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25591, '6000-002', To_Date('', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25591, '6200-004', To_Date('13-Jun-2014 10:39:33', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25591, '6300-002', To_Date('13-Jun-2014 18:46:05', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25591, '3500-003', To_Date('13-Jun-2014 12:51:48', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25592, '3010-001', To_Date('15-Jun-2014 20:10:14', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25593, '3600-001', To_Date('', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25593, '2230-005', To_Date('17-Jun-2014 11:52:58', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25594, '2240-002', To_Date('22-Jun-2014 10:47:48', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25600, '3300-001', To_Date('04-Sep-2014 15:57:51', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25600, '6000-001', To_Date('05-Sep-2014 17:22:26', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20406, '6200-004', To_Date('09-Dec-2013 13:30:08', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20406, '6300-002', To_Date('09-Dec-2013 11:09:20', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20407, '3500-003', To_Date('09-Dec-2013 12:09:02', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20407, '3010-001', To_Date('11-Dec-2013 13:57:43', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20438, '3600-001', To_Date('10-Jan-2014 15:11:15', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20438, '2230-005', To_Date('14-Jan-2014 10:52:46', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20549, '2240-002', To_Date('16-Jan-2014 17:28:07', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20549, '3200-002', To_Date('16-Jan-2014 17:29:33', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20549, '2230-004', To_Date('16-Jan-2014 14:04:31', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20650, '2240-001', To_Date('17-Jan-2014 12:19:28', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20711, '2230-004', To_Date('17-Feb-2014 13:34:11', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20711, '1100-002', To_Date('13-Feb-2014 16:07:54', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20711, '8000-002', To_Date('13-Feb-2014 13:42:59', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20711, '8300-001', To_Date('13-Feb-2014 18:26:08', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20812, '8300-004', To_Date('15-Feb-2014 19:49:03', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(22114, '2230-005', To_Date('12-Apr-2014 11:22:40', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(22114, '2500-005', To_Date('12-Apr-2014 15:20:26', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'Y', .5);  

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23100, '4700-008', To_Date('09-Apr-2014 20:27:50', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23100, '8100-001', To_Date('07-Apr-2014 20:55:33', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23100, '8300-003', To_Date('07-Apr-2014 16:38:27', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23101, '8000-005', To_Date('08-Apr-2014 17:47:41', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23101, '8300-001', To_Date('08-Apr-2014 10:08:05', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23101, '5500-001', To_Date('06-Apr-2014 16:56:51', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23102, '7300-003', To_Date('06-Apr-2014 11:01:19', 'DD-Mon-YYYY HH24:MI:SS'), 2, 2.75, 'Y', 2);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23102, '8000-001', To_Date('08-Apr-2014 19:41:18', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23203, '8000-002', To_Date('09-Apr-2014 10:56:51', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23304, '3300-003', To_Date('09-Apr-2014 11:06:23', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23304, '6000-001', To_Date('07-Apr-2014 19:21:45', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23305, '6000-002', To_Date('09-Apr-2014 12:25:30', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23305, '6200-004', To_Date('09-Apr-2014 17:20:45', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23305, '6300-002', To_Date('09-Apr-2014 12:11:29', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23506, '3500-003', To_Date('09-Apr-2014 16:03:33', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23617, '3010-001', To_Date('12-Apr-2014 10:36:45', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23618, '3600-001', To_Date('12-Apr-2014 19:27:22', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23618, '2230-003', To_Date('16-Apr-2014 20:29:02', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23618, '2240-002', To_Date('16-Apr-2014 17:08:24', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23809, '3200-002', To_Date('18-Apr-2014 16:13:03', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(23900, '2230-005', To_Date('19-Apr-2014 19:35:58', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(24111, '2240-001', To_Date('21-Apr-2014 10:07:13', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(24212, '2230-004', To_Date('22-Apr-2014 10:54:26', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(24414, '8000-002', To_Date('23-Apr-2014 18:01:08', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(24414, '8300-001', To_Date('23-Apr-2014 12:54:03', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(24414, '8300-005', To_Date('23-Apr-2014 18:06:17', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25576, '7300-003', To_Date('15-May-2014 09:04:24', 'DD-Mon-YYYY HH24:MI:SS'), 2, 5.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25576, '8000-001', To_Date('17-May-2014 11:14:34', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25576, '8300-004', To_Date('17-May-2014 13:40:28', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25577, '3300-003', To_Date('24-May-2014 10:02:38', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(25578, '6000-001', To_Date('27-May-2014 14:38:54', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15597, '3200-002', To_Date('30-Aug-2013 17:34:17', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15598, '2230-005', To_Date('05-Sep-2013 16:53:55', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15598, '2240-001', To_Date('05-Sep-2013 20:02:36', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15599, '2230-004', To_Date('07-Sep-2013 19:16:22', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15600, '1100-002', To_Date('03-Sep-2013 13:51:34', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15600, '8000-002', To_Date('03-Sep-2013 12:46:11', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15600, '8300-001', To_Date('03-Sep-2013 18:55:27', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20100, '3600-002', To_Date('08-Sep-2013 15:20:16', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20100, '4500-001', To_Date('06-Sep-2013 13:22:08', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20101, '3200-001', To_Date('08-Sep-2013 18:43:33', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20101, '5300-002', To_Date('08-Sep-2013 12:34:34', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20102, '2210-003', To_Date('13-Oct-2013 13:04:48', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20103, '2220-001', To_Date('14-Oct-2013 20:50:07', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20104, '2220-002', To_Date('14-Oct-2013 19:55:20', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20105, '2210-002', To_Date('14-Oct-2013 17:37:06', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20105, '2220-002', To_Date('14-Oct-2013 10:41:26', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20105, '2230-012', To_Date('14-Oct-2013 16:57:56', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20105, '3010-005', To_Date('14-Oct-2013 09:08:57', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'Y', .5);  

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20106, '3200-001', To_Date('14-Oct-2013 10:12:54', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20106, '4500-002', To_Date('10-Oct-2013 13:32:37', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20106, '3300-001', To_Date('10-Oct-2013 14:20:35', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20107, '3100-001', To_Date('11-Oct-2013 10:17:19', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20107, '2500-003', To_Date('11-Oct-2013 10:22:42', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20107, '7200-003', To_Date('11-Oct-2013 16:11:42', 'DD-Mon-YYYY HH24:MI:SS'), 2, 2.75, 'Y', 2);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20108, '4100-001', To_Date('10-Oct-2013 14:34:34', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20108, '3500-002', To_Date('10-Oct-2013 14:43:02', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20109, '1000-001', To_Date('12-Oct-2013 16:06:19', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20109, '7300-001', To_Date('12-Oct-2013 09:54:50', 'DD-Mon-YYYY HH24:MI:SS'), 2, 2.75, 'Y', 2);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20109, '3900-002', To_Date('12-Oct-2013 14:30:44', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20110, '4500-003', To_Date('13-Oct-2013 14:47:35', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20111, '5400-002', To_Date('17-Oct-2013 13:27:11', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20111, '5500-002', To_Date('17-Oct-2013 16:04:14', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'Y', 3.83);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20112, '2240-002', To_Date('22-Oct-2013 16:56:58', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20114, '2240-001', To_Date('22-Oct-2013 18:47:52', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20210, '2230-005', To_Date('07-Nov-2013 10:09:31', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20210, '2500-005', To_Date('05-Nov-2013 14:36:50', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20210, '4700-008', To_Date('07-Nov-2013 20:50:16', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20211, '8100-001', To_Date('05-Nov-2013 11:28:27', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20211, '1100-002', To_Date('05-Nov-2013 14:58:49', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20211, '8300-005', To_Date('05-Nov-2013 12:39:06', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20212, '8300-001', To_Date('06-Nov-2013 19:37:48', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20303, '5500-001', To_Date('06-Nov-2013 18:22:14', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20303, '1100-003', To_Date('06-Nov-2013 19:09:30', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20303, '8000-001', To_Date('06-Nov-2013 15:20:31', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20303, '8300-004', To_Date('06-Nov-2013 19:49:14', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20304, '3300-003', To_Date('08-Dec-2013 18:35:31', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20304, '6000-001', To_Date('08-Dec-2013 16:29:22', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(20315, '6000-002', To_Date('08-Dec-2013 08:43:16', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'Y', 2);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15576, '3600-002', To_Date('17-May-2013 08:54:26', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15576, '4500-001', To_Date('15-May-2013 20:03:41', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15577, '3200-001', To_Date('24-May-2013 12:32:34', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15577, '5300-002', To_Date('24-May-2013 18:40:10', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15578, '2210-003', To_Date('31-May-2013 09:04:18', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15578, '2220-001', To_Date('31-May-2013 08:05:55', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15579, '2220-002', To_Date('06-Jun-2013 12:51:41', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15580, '2210-003', To_Date('09-Jun-2013 14:05:04', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15580, '2220-001', To_Date('09-Jun-2013 20:11:28', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15581, '2230-012', To_Date('09-Jun-2013 10:21:22', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15581, '3010-005', To_Date('05-Jun-2013 12:54:32', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15582, '3200-001', To_Date('06-Jun-2013 11:51:24', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15583, '4500-002', To_Date('07-Jun-2013 19:13:40', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15583, '3300-001', To_Date('07-Jun-2013 09:21:59', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15584, '3100-001', To_Date('05-Jun-2013 16:58:52', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15584, '2500-003', To_Date('08-Jun-2013 14:51:39', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'Y', .5);  

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15584, '7200-003', To_Date('07-Jun-2013 14:05:21', 'DD-Mon-YYYY HH24:MI:SS'), 2, 2.75, 'Y', 2);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15585, '4100-001', To_Date('08-Jun-2013 08:30:47', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15586, '3500-002', To_Date('06-Jun-2013 12:59:06', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15586, '1000-001', To_Date('07-Jun-2013 19:11:23', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15586, '7300-001', To_Date('07-Jun-2013 09:38:27', 'DD-Mon-YYYY HH24:MI:SS'), 2, 2.75, 'Y', 2);   

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15586, '3900-002', To_Date('07-Jun-2013 09:03:31', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15587, '4500-003', To_Date('07-Jun-2013 15:02:17', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15587, '5500-002', To_Date('06-Jun-2013 20:07:25', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15587, '5400-002', To_Date('09-Jun-2013 19:04:51', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15588, '2240-002', To_Date('14-Jun-2013 15:59:55', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15589, '2240-001', To_Date('13-Jun-2013 17:26:15', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15589, '2230-005', To_Date('13-Jun-2013 18:14:50', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15590, '2500-005', To_Date('09-Jun-2013 10:40:54', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15590, '4700-008', To_Date('09-Jun-2013 15:09:03', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15590, '1400-001', To_Date('09-Jun-2013 17:58:51', 'DD-Mon-YYYY HH24:MI:SS'), 1, 22.75, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15591, '1100-002', To_Date('11-Jun-2013 09:10:23', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15591, '8300-005', To_Date('11-Jun-2013 14:15:02', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15591, '8200-001', To_Date('11-Jun-2013 10:28:56', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15591, '5500-001', To_Date('11-Jun-2013 09:24:09', 'DD-Mon-YYYY HH24:MI:SS'), 1, 4.99, 'Y', 3.83);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15592, '1100-003', To_Date('12-Jun-2013 11:36:29', 'DD-Mon-YYYY HH24:MI:SS'), 1, 16.99, 'N', Null); 

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15592, '8000-001', To_Date('12-Jun-2013 17:03:26', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15592, '8300-004', To_Date('12-Jun-2013 12:43:24', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15593, '3300-003', To_Date('15-Jun-2013 11:14:19', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15594, '6000-001', To_Date('16-Jun-2013 12:42:11', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15594, '6100-001', To_Date('16-Jun-2013 15:20:59', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15594, '6200-004', To_Date('16-Jun-2013 10:06:16', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15594, '6300-002', To_Date('16-Jun-2013 17:27:19', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.99, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15595, '3500-003', To_Date('11-Jul-2013 18:43:28', 'DD-Mon-YYYY HH24:MI:SS'), 2, 4.27, 'Y', 1.75);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15596, '3010-001', To_Date('21-Aug-2013 19:46:49', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15596, '3600-001', To_Date('23-Aug-2013 13:03:49', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15597, '2230-005', To_Date('30-Aug-2013 12:52:42', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);

Insert into Rental_Invoice_Detail
	(invoice_number, bar_code, date_returned, rental_duration, original_rental_rate, overdue_paid_yn, overdue_rental_rate)
values
	(15597, '2240-002', To_Date('30-Aug-2013 12:55:52', 'DD-Mon-YYYY HH24:MI:SS'), 7, 3.75, 'N', Null);


-- insert into the special orders table

Insert into Special_Order
	(Order_Number, Member_Number, Order_Date, Received_Date, Picked_Up_Date)
Values
	(225, 250, To_Date('04-Jul-2014 13:36:57', 'DD-Mon-YYYY HH24:MI:SS'), To_Date('19-Aug-2014 11:45:59', 'DD-Mon-YYYY HH24:MI:SS'), To_Date('07-Sep-2014 08:01:31', 'DD-Mon-YYYY HH24:MI:SS'));

Insert into Special_Order
	(Order_Number, Member_Number, Order_Date, Received_Date, Picked_Up_Date)
Values
	(230, 250, To_Date('08-Sep-2014 08:01:33', 'DD-Mon-YYYY HH24:MI:SS'), null, null);

Insert into Special_Order
	(Order_Number, Member_Number, Order_Date, Received_Date, Picked_Up_Date)
Values
	(200, 120, To_Date('05-Aug-2014 15:45:12', 'DD-Mon-YYYY HH24:MI:SS'), null, null);

Insert into Special_Order
	(Order_Number, Member_Number, Order_Date, Received_Date, Picked_Up_Date)
Values
	(205, 730, To_Date('05-Sep-2014 09:23:47', 'DD-Mon-YYYY HH24:MI:SS'), To_Date('11-Sep-2014 18:16:12', 'DD-Mon-YYYY HH24:MI:SS'), null);

-- insert into the special order item table

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(15, 'The Godfather - 25th Anniversary Edition', 14.85);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(35, 'The Maltese Falcon', 7.75);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(40, 'Princess Bride', 17.87);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(20, 'Casablanca', 49.95);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(25, 'Citizen Kane', 39.99);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(55, 'The Bridge On The River Kwai', 9.93);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(60, 'Microsoft X-BOX 360', 512.57);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(30, 'The Sting', 42.5);

Insert into Special_Order_Item
	(Item_Number, Description, Item_Cost)
values
	(65, 'One Flew Over The Cuckoo''s Nest', 32.95);

-- insert into the order detail table

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(200, 25, 4, 39.99);

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(230, 40, 3, 22.5);

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(225, 40, 2, 22.5);

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(200, 20, 3, 49.95);

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(205, 40, 1, 22.5);

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(230, 35, 1, 10.99);

Insert into Special_Order_Detail
	(Order_Number, Item_Number, Quantity, Sales_Price)
values
	(205, 15, 1, 14.85);

commit;

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