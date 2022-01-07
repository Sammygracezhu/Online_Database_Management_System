create table Customer 
(customerID  NUMBER(10),
fName       varchar2(20),
lName       varchar2(20),
email       varchar2(50),
street      varchar2(40),
city        varchar2(50),
state       varchar2(10),
zip         varchar2(10),
constraint PK_customer PRIMARY KEY (customerID));


create table PhoneNumber
(customerID     NUMBER(10),
phoneNumber1     NUMBER,
phoneNumber2    NUMBER,
CONSTRAINT PK_phoneNumber PRIMARY KEY (customerID, phoneNumber1),
CONSTRAINT FK_phoneNumber FOREIGN KEY (customerID) REFERENCES Customer (customerID));


create table Account
(username  VARCHAR2(50),
password   VARCHAR2(30), 
customerID  NUMBER(15),
CONSTRAINT PK_Account PRIMARY KEY (username),
CONSTRAINT FK_Account FOREIGN KEY (customerID) REFERENCES Customer(customerID));


create table "Order"
(orderID          NUMBER(10),
orderDate         DATE,
shippingMethod   VARCHAR2(20),
shipAddress       VARCHAR2(50),
shippedDate       DATE,
deliveredDate     DATE,
userName          VARCHAR2(20),
CONSTRAINT PK_Order PRIMARY KEY (orderID),
CONSTRAINT shipMethod CHECK (shippingMethod IN ('UPS','USPS','FedEx')),
CONSTRAINT FK_Order FOREIGN KEY (userName) REFERENCES Account(userName));

create table Payment
(paymentID   NUMBER(10),
paymentdate  DATE,
paymentMethod  VARCHAR2(10),
orderID   NUMBER(10),
CONSTRAINT PK_Payment PRIMARY KEY (paymentID),
CONSTRAINT payment_check CHECK (paymentMethod in ('CREDIT', 'DEBIT', 'PAYPAL', 'VENMO')),
CONSTRAINT FK_Payment FOREIGN KEY (orderID) REFERENCES "Order"(orderID));

create table LineItem
(orderID        NUMBER(10),
lineItemID      NUMBER(10),
quantity        NUMBER(10),
discount        NUMBER(2,2),
product#        NUMBER(10),
CONSTRAINT PK_LineItem PRIMARY KEY (orderID, lineItemID),
CONSTRAINT FK_LineItem FOREIGN KEY (orderID) REFERENCES "Order"(orderID));

create table Product 
(product#       NUMBER(10),
productName     VARCHAR2(15),
price    NUMBER(7,2),
description     VARCHAR2(300),
CONSTRAINT PK_Product PRIMARY KEY (product#));

create table Image
(product#      NUMBER(10),
image#         NUMBER(4),
imageType       VARCHAR2(10),
CONSTRAINT PK_Image  PRIMARY KEY (product#, image#),
CONSTRAINT FK_Image  FOREIGN KEY (product#) REFERENCES Product (product#));

create sequence customer_seq start with 101 increment by 1;

INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Bennet', 'Abraham', '','6223 Bateman St.', 'Berkeley', 'CA','94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Green', 'Marjorie', '','309 63rd St. #411', 'Oakland', 'CA',  '94618');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Carson', 'Cheryl', '', '589 Darwin Ln.', 'Berkeley', 'CA',  '94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ringer', 'Albert', '', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ringer', 'Anne',  '','67 Seventh Av.', 'Salt Lake City', 'UT',  '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'DeFrance', 'Michel', '','3 Balding Pl.', 'Gary', 'IN',  '46403');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Panteley', 'Sylvia', '', '1956 Arlington Pl.', 'Rockville', 'MD',  '20853');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'McBadden', 'Heather', '', '301 Putnam', 'Vacaville', 'CA',  '95688');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Stringer', 'Dirk', '', '5420 Telegraph Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Straight', 'Dick', '', '5420 College Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Karsen', 'Livia','',  '5720 McAuley St.', 'Oakland', 'CA', '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'MacFeather', 'Stearns', '', '44 Upland Hts.', 'Oakland', 'CA',  '94612');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dull', 'Ann', '', '3410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Yokomoto', 'Akiko', '', '3 Silver Ct.', 'Walnut Creek', 'CA',  '94595');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'O Leary', 'Michael', '', '22 Cleveland Av. #14', 'San Jose', 'CA',  '95128');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Gringlesby', 'Burt','',  'PO Box 792', 'Covelo', 'CA',  '95428');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Greene', 'Morningstar', '', '22 Graybar House Rd.', 'Nashville', 'TN',  '37215');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'White', 'Johnson','',  '10932 Bigge Rd.', 'Menlo Park', 'CA',  '94025');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'del Castillo', 'Innes', '', '2286 Cram Pl. #86', 'Ann Arbor', 'MI',  '48105');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Hunter', 'Sheryl','', '3410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Locksley', 'Chastity', '', '18 Broadway Av.', 'San Francisco', 'CA',  '94130');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Blotchet-Halls', 'Reginald', '', '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Tith', 'Gander', '', '10 Mississippi Dr.', 'Lawrence', 'KS', '66044');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Aennet', 'Bbraham', '','622 Bateman St.', 'Berkeley', 'CA','94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Hreen', 'Qarjorie', '','3098 63rd St. #411', 'Oakland', 'CA',  '94618');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Darson', 'Hheryl', '', '5889 Darwin Ln.', 'Berkeley', 'CA',  '94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Hinger', 'Clbert', '', '617 Seventh Av.', 'Salt Lake City', 'UT', '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Jinger', 'Anne',  '','167 Seventh Av.', 'Salt Lake City', 'UT',  '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'TeFrance', 'Nichel','', '13 Balding Pl.', 'Gary', 'IN',  '46403');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Panteley', 'Sylvia', '', '156 Arlington Pl.', 'Rockville', 'MD',  '20853');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'NcBadden', 'Yeather','',  '3801 Putnam', 'Vacaville', 'CA',  '95688');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'James', 'Dirk', '', '542 Telegraph Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Straight', 'HHDick', '', '420 College Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Karsen', 'Livia', '', '720 McAuley St.', 'Oakland', 'CA', '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'MacFeather', 'Stearns', '', '404 Upland Hts.', 'Oakland', 'CA',  '94612');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Full', 'Ann',  '','410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Yokomoto', 'Bkiko','',  '309 Silver Ct.', 'Walnut Creek', 'CA',  '94595');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'P Leary', 'Michael', '', '822 Cleveland Av. #14', 'San Jose', 'CA',  '95128');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Rringlesby', 'Burt', '', 'PO Box 792', 'Covelo', 'CA',  '95428');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dreene', 'Morningstar', '', '922 Graybar House Rd.', 'Nashville', 'TN',  '37215');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ehite', 'Johnson', '', '1932 Bigge Rd.', 'Menlo Park', 'CA',  '94025');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ael Castillo', 'Innes', '', '286 Cram Pl. #86', 'Ann Arbor', 'MI',  '48105');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Bunter', 'Sheryl', '','410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Qocksley', 'Chastity', '', '918 Broadway Av.', 'San Francisco', 'CA',  '94130');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Blotchet-Halls', 'Reginald', '', '855 Hillsdale Bl.', 'Corvallis', 'OR', '97330');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Smith', 'Eeander',  '','710 Mississippi Dr.', 'Lawrence', 'KS', '66044');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'kannet', 'Draham','', '22 Bateman St.', 'Berkeley', 'CA','94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Geen', 'Rrjorie', '','098 63rd St. #411', 'Oakland', 'CA',  '94618');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Grson', 'Qeryl', '', '889 Darwin Ln.', 'Berkeley', 'CA',  '94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Winger', 'Clbert', '', '17 Seventh Av.', 'Salt Lake City', 'UT', '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Penger', 'Anne', '', '17 Seventh Av.', 'Salt Lake City', 'UT',  '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'KeFrance', 'aNichel','', '1 Balding Pl.', 'Gary', 'IN',  '46403');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Unteley', 'Sylvia', '', '16 Arlington Pl.', 'Rockville', 'MD',  '20853');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'OcBadden', 'Keather','',  '301 Putnam', 'Vacaville', 'CA',  '95688');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'James', 'Cirk', '', '52 Telegraph Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Straight', 'Aick','',  '40 College Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dsen', 'Livia', '', '70 McAuley St.', 'Oakland', 'CA', '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Feather', 'Stearns', '', '404 Upland Hts.', 'Oakland', 'CA',  '94612');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Full', 'Benn', '', '40 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Toto', 'Bkiko', '', '39 Silver Ct.', 'Walnut Creek', 'CA',  '94595');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Leary', 'Michael', '', '22 Cleveland Av. #14', 'San Jose', 'CA',  '95128');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dinglesby', 'Burt', '', 'PO Box 799', 'Covelo', 'CA',  '95428');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Xeene', 'Morningstar','',  '92234 Graybar House Rd.', 'Nashville', 'TN',  '37215');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Zite', 'Johnson', '', '21932 Bigge Rd.', 'Menlo Park', 'CA',  '94025');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Zel Castillo', 'Innes', '', '7286 Cram Pl. #86', 'Ann Arbor', 'MI',  '48105');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Runter', 'Sheryl','', '5410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Rocksley', 'Chastity','',  '3918 Broadway Av.', 'San Francisco', 'CA',  '94130');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Rlotchet-Halls', 'Reginald', '', '2855 Hillsdale Bl.', 'Corvallis', 'OR', '97330');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Fimith', 'Eeander','',  '2710 Mississippi Dr.', 'Lawrence', 'KS', '66044');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Bennet', 'Abraham','', '6223 Bateman St.', 'Berkeley', 'CA','94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Green', 'Marjorie','', '309 63rd St. #411', 'Oakland', 'CA',  '94618');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Carson', 'Cheryl', '', '589 Darwin Ln.', 'Berkeley', 'CA',  '94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ringer', 'Albert', '', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ringer', 'Anne', '', '67 Seventh Av.', 'Salt Lake City', 'UT',  '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'DeFrance', 'Michel', '','3 Balding Pl.', 'Gary', 'IN',  '46403');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Panteley', 'Sylvia','',  '1956 Arlington Pl.', 'Rockville', 'MD',  '20853');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'McBadden', 'Heather','',  '301 Putnam', 'Vacaville', 'CA',  '95688');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Stringer', 'Dirk', '', '5420 Telegraph Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Straight', 'Dick', '', '5420 College Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Karsen', 'Livia', '', '5720 McAuley St.', 'Oakland', 'CA', '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'MacFeather', 'Stearns', '', '44 Upland Hts.', 'Oakland', 'CA',  '94612');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dull', 'Ann',  '','3410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Yokomoto', 'Akiko', '', '3 Silver Ct.', 'Walnut Creek', 'CA',  '94595');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'O Leary', 'Michael', '', '22 Cleveland Av. #14', 'San Jose', 'CA',  '95128');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Gringlesby', 'Burt', '', 'PO Box 792', 'Covelo', 'CA',  '95428');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Greene', 'Morningstar', '', '22 Graybar House Rd.', 'Nashville', 'TN',  '37215');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'White', 'Johnson', '', '10932 Bigge Rd.', 'Menlo Park', 'CA',  '94025');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'del Castillo', 'Innes', '', '2286 Cram Pl. #86', 'Ann Arbor', 'MI',  '48105');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Hunter', 'Sheryl', '','3410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Locksley', 'Chastity', '', '18 Broadway Av.', 'San Francisco', 'CA',  '94130');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Blotchet-Halls', 'Reginald', '', '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Smith', 'Meander', '', '10 Mississippi Dr.', 'Lawrence', 'KS', '66044');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Winnet', 'Haham', '','42 Bateman St.', 'Berkeley', 'CA','94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Aeen', 'Ajorie','', '38 63rd St. #411', 'Oakland', 'CA',  '94618');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Yson', 'Gryl', '', '589 Darwin Ln.', 'Berkeley', 'CA',  '94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Fer', 'Clbert', '', '87 Seventh Av.', 'Salt Lake City', 'UT', '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Lger', 'Anney',  '','97 Seventh Av.', 'Salt Lake City', 'UT',  '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dance', 'Tehel', '','333 Balding Pl.', 'Gary', 'IN',  '46403');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'NcBadden', 'Yeather',  '','6701 Putnam', 'Vacaville', 'CA',  '95688');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'James', 'Herk',  '','8542 Telegraph Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Bright', 'Gick', '', '8420 College Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Den', 'Via',  '','3720 McAuley St.', 'Oakland', 'CA', '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Maceather', 'Larns',  '','1404 Upland Hts.', 'Oakland', 'CA',  '94612');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Fell', 'Aenn', '', '1410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Moto', 'Kiko',  '','1309 Silver Ct.', 'Walnut Creek', 'CA',  '94595');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Leary', 'Michael', '', '5822 Cleveland Av. #14', 'San Jose', 'CA',  '95128');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Lesby', 'Durt', '', 'PO Box 555', 'Covelo', 'CA',  '95428');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dret', 'Ningstar', '', '5922 Graybar House Rd.', 'Nashville', 'TN',  '37215');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ehite', 'Nelson', '', '932 Bigge Rd.', 'Menlo Park', 'CA',  '94025');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Castillo', 'Vnes', '', '2786 Cram Pl. #86', 'Ann Arbor', 'MI',  '48105');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ter', 'Jeryl', '','1410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Sley', 'Tity', '', '1918 Broadway Av.', 'San Francisco', 'CA',  '94130');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Tchet-Halls', 'Ginald', '', '1855 Hillsdale Bl.', 'Corvallis', 'OR', '97330');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Smith', 'Bander', '', '1710 Mississippi Dr.', 'Lawrence', 'KS', '66044');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Tonet', 'Haham', '','122 Bateman St.', 'Berkeley', 'CA','94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Geen', 'Jorie', '','1098 63rd St. #411', 'Oakland', 'CA',  '94618');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Grson', 'Eryl', '', '1889 Darwin Ln.', 'Berkeley', 'CA',  '94705');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Winger', 'Dbert', '', '45117 Seventh Av.', 'Salt Lake City', 'UT', '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Penger', 'Vene', '', '117 Seventh Av.', 'Salt Lake City', 'UT',  '84152');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'KeFrance', 'Dhel','', '111 Balding Pl.', 'Gary', 'IN',  '46403');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Teley', 'Kvia', '', '116 Arlington Pl.', 'Rockville', 'MD',  '20853');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Badden', 'Keather', '', '1301 Putnam', 'Vacaville', 'CA',  '95688');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Fames', 'Cirk', '', '5112 Telegraph Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Aight', 'Aick', '', '410 College Av.', 'Oakland', 'CA',  '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Daatsen', 'Livia', '', '710 McAuley St.', 'Oakland', 'CA', '94609');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Ather', 'Tearns', '', '4104 Upland Hts.', 'Oakland', 'CA',  '94612');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Giull', 'Benn', '', '410 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Pike', 'Tooto', '', '319 Silver Ct.', 'Walnut Creek', 'CA',  '94595');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Tary', 'Michael', '', '122 Cleveland Av. #14', 'San Jose', 'CA',  '95128');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Dingle', 'Burt', '', 'PO Box 711', 'Covelo', 'CA',  '95428');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Eine', 'Star', '', '034 Graybar House Rd.', 'Nashville', 'TN',  '37215');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Zite', 'Kson', '', '732 Bigge Rd.', 'Menlo Park', 'CA',  '94025');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Zel Castillo', 'Innes',  '','56 Cram Pl. #86', 'Ann Arbor', 'MI',  '48105');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Niter', 'Jyl', '','610 Blonde St.', 'Palo Alto', 'CA',  '94301');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Rock', 'Chastity',  '','718 Broadway Av.', 'San Francisco', 'CA',  '94130');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Halls', 'Reginald', '', '655 Hillsdale Bl.', 'Corvallis', 'OR', '97330');
INSERT INTO customer VALUES (CUSTOMER_SEQ.nextval, 'Fimith', 'Tander',  '','510 Mississippi Dr.', 'Lawrence', 'KS', '66044');

select * from customer;
commit;
update customer set email = lname||customerid||'@drexel.edu';



insert all 
into phonenumber 
select customerid, 215||customerid||SUBSTR(ZIP,2,4), 267||customerid||SUBSTR(ZIP,0,4)  from customer;

select * from phonenumber;

commit;

INSERT ALL 
INTO Account 
select fName || customerid, concat(lname, zip), customerid from customer;

commit;

insert all 
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1001, TO_DATE('1985-10-28', 'YYYY-MM-DD'), 'UPS', '567 Pasadena Ave., Tustin, CA',TO_DATE('1985-11-05', 'YYYY-MM-DD'), TO_DATE('1985-11-09', 'YYYY-MM-DD'),
'Panteley107')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1002, TO_DATE('1990-05-31', 'YYYY-MM-DD'), 'UPS', '3801 Putnam, Vacaville, CA',TO_DATE('1990-06-05', 'YYYY-MM-DD'), TO_DATE('1990-06-25', 'YYYY-MM-DD'),
'NcBadden131')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1003, TO_DATE('1990-05-25', 'YYYY-MM-DD'), 'UPS', '3801 Putnam, Vacaville, CA',TO_DATE('1990-05-31', 'YYYY-MM-DD'), TO_DATE('1990-06-09', 'YYYY-MM-DD'),
'NcBadden131')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1004, TO_DATE('1990-07-22', 'YYYY-MM-DD'), 'UPS', '3801 Putnam, Vacaville, CA',TO_DATE('1990-08-05', 'YYYY-MM-DD'), TO_DATE('1990-08-22', 'YYYY-MM-DD'),
'NcBadden131')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1005, TO_DATE('1990-02-22', 'YYYY-MM-DD'), 'UPS', '3801 Putnam, Vacaville, CA',TO_DATE('1990-03-05', 'YYYY-MM-DD'), TO_DATE('1990-03-12', 'YYYY-MM-DD'),
'NcBadden131')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1011, TO_DATE('1990-02-22', 'YYYY-MM-DD'), 'UPS', '3801 Putnam, Vacaville, CA',TO_DATE('1990-03-05', 'YYYY-MM-DD'), TO_DATE('1990-03-15', 'YYYY-MM-DD'),
'NcBadden131')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1006, TO_DATE('1990-05-23', 'YYYY-MM-DD'), 'UPS', '1956 Arlington Pl. Rockville MD',TO_DATE('1990-06-05', 'YYYY-MM-DD'), TO_DATE('1990-06-22', 'YYYY-MM-DD'),
'Sley212')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1007, TO_DATE('1990-04-26', 'YYYY-MM-DD'), 'UPS', '1956 Arlington Pl. Rockville MD',TO_DATE('1990-06-05', 'YYYY-MM-DD'), TO_DATE('1990-06-07', 'YYYY-MM-DD'),
'Sley212')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1008, TO_DATE('1990-06-26', 'YYYY-MM-DD'), 'UPS', '1956 Arlington Pl. Rockville MD',TO_DATE('1990-07-05', 'YYYY-MM-DD'), TO_DATE('1990-08-07', 'YYYY-MM-DD'),
'Sley212')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1013, TO_DATE('1990-09-26', 'YYYY-MM-DD'), 'UPS', '1956 Arlington Pl. Rockville MD',TO_DATE('1990-10-05', 'YYYY-MM-DD'), TO_DATE('1990-10-07', 'YYYY-MM-DD'),
'Sley212')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1009, TO_DATE('1990-03-26', 'YYYY-MM-DD'), 'UPS', '1956 Arlington Pl. Rockville MD',TO_DATE('1990-04-05', 'YYYY-MM-DD'), TO_DATE('1990-04-07', 'YYYY-MM-DD'),
'Sley212')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1010, TO_DATE('1990-04-27', 'YYYY-MM-DD'), 'UPS', '1956 Arlington Pl. Rockville MD',TO_DATE('1990-06-04', 'YYYY-MM-DD'), TO_DATE('1990-06-09', 'YYYY-MM-DD'),
'Sley212')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1012, TO_DATE('1990-07-27', 'YYYY-MM-DD'), 'UPS', '221 Cram Pl. #86 Ann Arbor MI',TO_DATE('1990-08-04', 'YYYY-MM-DD'), TO_DATE('1990-08-09', 'YYYY-MM-DD'),
'del Castillo119')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1014, TO_DATE('1985-10-23', 'YYYY-MM-DD'), 'USPS', '1710 Mississippi Dr., Lawrence, KS',TO_DATE('1985-11-04', 'YYYY-MM-DD'), TO_DATE('1985-11-07', 'YYYY-MM-DD'),
'Smith214')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1015, TO_DATE('1990-05-23', 'YYYY-MM-DD'), 'USPS', '3720 McAuley St., Oakland, CA',TO_DATE('1990-06-06', 'YYYY-MM-DD'), TO_DATE('1990-06-21', 'YYYY-MM-DD'),
'Den202')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1016, TO_DATE('1990-05-20', 'YYYY-MM-DD'), 'USPS', '42 Bateman St., Berkeley, CA',TO_DATE('1990-05-24', 'YYYY-MM-DD'), TO_DATE('1990-06-04', 'YYYY-MM-DD'),
'Winnet193')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1017, TO_DATE('1990-07-21', 'YYYY-MM-DD'), 'FedEx', '117 Seventh Av., Salt Lake City, UT',TO_DATE('1990-07-05', 'YYYY-MM-DD'), TO_DATE('1990-08-02', 'YYYY-MM-DD'),
'Penger219')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1018, TO_DATE('1990-01-22', 'YYYY-MM-DD'), 'FedEx', '13 Silver Ct. Walnut Creek, CA',TO_DATE('1990-02-05', 'YYYY-MM-DD'), TO_DATE('1990-02-12', 'YYYY-MM-DD'),
'Yokomoto183')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1019, TO_DATE('1990-02-22', 'YYYY-MM-DD'), 'FedEx', '542 Telegraph, Av. Oakland, CA',TO_DATE('1990-03-05', 'YYYY-MM-DD'), TO_DATE('1990-03-15', 'YYYY-MM-DD'),
'James132')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1020, TO_DATE('1990-02-23', 'YYYY-MM-DD'), 'USPS', '10932 Bigge Rd., Menlo Park, CA',TO_DATE('1990-04-05', 'YYYY-MM-DD'), TO_DATE('1990-05-22', 'YYYY-MM-DD'),
'White187')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate,  username)
values (1021, TO_DATE('1990-04-26', 'YYYY-MM-DD'), 'USPS', '10932 Bigge Rd., Menlo Park, CA',TO_DATE('1990-06-05', 'YYYY-MM-DD'), TO_DATE('1990-06-07', 'YYYY-MM-DD'),
'White187')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1022, TO_DATE('1990-06-26', 'YYYY-MM-DD'), 'USPS', '10932 Bigge Rd., Menlo Park, CA',TO_DATE('1990-07-05', 'YYYY-MM-DD'), TO_DATE('1990-08-07', 'YYYY-MM-DD'),
'White187')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1023, TO_DATE('1990-09-26', 'YYYY-MM-DD'), 'USPS', '10932 Bigge Rd., Menlo Park, CA',TO_DATE('1990-10-05', 'YYYY-MM-DD'), TO_DATE('1990-10-07', 'YYYY-MM-DD'),
'White187')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1024, TO_DATE('1990-03-26', 'YYYY-MM-DD'), 'UPS', '10932 Bigge Rd., Menlo Park, CA',TO_DATE('1990-04-05', 'YYYY-MM-DD'), TO_DATE('1990-04-07', 'YYYY-MM-DD'),
'White187')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1025, TO_DATE('1990-04-27', 'YYYY-MM-DD'), 'USPS', '6223 Bateman St., Berkeley, CA',TO_DATE('1990-06-04', 'YYYY-MM-DD'), TO_DATE('1990-06-09', 'YYYY-MM-DD'),
'Bennet101')
into "Order" (orderID, orderDate, shippingMethod, shipAddress, shippedDate, deliveredDate, username)
values (1026, TO_DATE('1990-07-27', 'YYYY-MM-DD'), 'FedEx', '6223 Bateman St., Berkeley, CA',TO_DATE('1990-08-04', 'YYYY-MM-DD'), TO_DATE('1990-08-09', 'YYYY-MM-DD'),
'Bennet101')
select * from dual;

commit;

INSERT ALL 
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (101, '28-Oct-85', 'CREDIT', 1001)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (102, '28-Oct-85', 'PAYPAL',  1001)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (103, '31-MAY-90', 'VENMO',  1002)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (104, '25-MAY-90', 'CREDIT',  1003)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (105, '22-JUL-90', 'DEBIT',  1004)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (106, '22-FEB-90', 'CREDIT',  1005)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (107, '22-FEB-90', 'CREDIT', 1011)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (108, '23-MAY-90', 'PAYPAL', 1006)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (109, '26-JUN-90', 'PAYPAL',  1007)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (110, '26-JUN-90', 'PAYPAL',  1008)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (111, '26-SEP-90', 'CREDIT',  1013)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (112, '26-MAR-90', 'DEBIT',  1009)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (113, '27-APR-90', 'DEBIT', 1010)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (114, '27-JUL-90', 'CREDIT', 1012)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (115, '23-OCT-90', 'DEBIT',  1014)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (116, '23-MAY-90', 'CREDIT',  1015)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (117, '20-MAY-90', 'CREDIT',  1016)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (118, '21-JUL-90', 'CREDIT',  1017)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (119, '21-Jan-90', 'CREDIT',  1018)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (120, '22-FEB-90', 'DEBIT',  1019)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (121, '23-FEB-90', 'CREDIT',  1020)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (122, '26-APR-90', 'CREDIT',  1021)
INTO Payment (paymentID, paymentDate, paymentMethod,  orderID)
VALUES (128, '26-APR-90', 'CREDIT',  1021)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (123, '26-JUN-90', 'CREDIT',  1022)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (124, '26-SEP-90', 'CREDIT',  1023)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (125, '27-APR-90', 'PAYPAL',  1024)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (126, '27-APR-90', 'CREDIT',  1025)
INTO Payment (paymentID, paymentDate, paymentMethod, orderID)
VALUES (127, '27-JUL-90', 'CREDIT',  1026)
select * from dual;

COMMIT;

insert all
into product (product#, productName, price, description) 
values (201, 'XZ-Model-B', 809, 'Faster running, new generation')
into product (product#, productName, price, description) 
values (202, 'XZ-Model-A', 1000, 'Normal running, first generation')
into product (product#, productName, price, description) 
values (203, 'Stroller', 10, 'Safety first')
into product (product#, productName, price, description) 
values (204, 'DX-09', 1000, 'Very good condition')
into product (product#, productName, price, description) 
values (205, 'DT-08', 90, 'Easy to use') 
into product (product#, productName, price, description) 
values (206, 'XW-03', 80, 'Man made')
into product (product#, productName, price, description) 
values (207, 'TX-009', 200, 'Follow instruction')
into product (product#, productName, price, description) 
values (208, 'CT-1001', 400, 'Ready to go')
into product (product#, productName, price, description) 
values (210, 'WT-A-10', 200, 'Small parts available')
into product (product#, productName, price, description) 
values (209, 'YT-90A', 1000, 'Can be used under any condition')
select * from dual;

commit;

insert all
into image (product#, image#, imageType) values (201, 1, 'JPEG')
into image (product#, image#, imageType) values (202, 1, 'JPEG')
into image (product#, image#, imageType) values (202, 2, 'JPEG')
into image (product#, image#, imageType) values (202, 3, 'JPEG')
into image (product#, image#, imageType) values (203, 1, 'PNG')
into image (product#, image#, imageType) values (204, 1, 'JPEG')
into image (product#, image#, imageType) values (205, 1, 'JPEG')
into image (product#, image#, imageType) values (206, 1, 'JPEG')
into image (product#, image#, imageType) values (207, 1, 'JPEG')
into image (product#, image#, imageType) values (208, 1, 'JPEG')
into image (product#, image#, imageType) values (209, 1, 'JPEG')
into image (product#, image#, imageType) values (209, 2, 'JPEG')
into image (product#, image#, imageType) values (209, 3, 'JPEG')
into image (product#, image#, imageType) values (209, 4, 'JPEG')
select * from dual;

commit;

insert all
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1001, 1, 4, 0.1, 201)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1001, 2, 1, 0.2, 210)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1001, 3, 2, 0, 208)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1002, 1, 4, 0.1, 204)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1003, 1, 2, 0.1, 205)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1004, 1, 2, 0.1, 207)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1005, 1, 1, 0.1, 209)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1006, 1, 2, 0.2, 202)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1007, 1, 1, 0.3, 204)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1008, 1, 1, 0.2, 203)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1009, 1, 3, 0.1, 205)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1010, 1, 1, 0.1, 206)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1011, 1, 3, 0.1, 207)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1012, 1, 1, 0.1, 208)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1013, 1, 4, 0.1, 210)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1014, 1, 6, 0.1, 210)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1015, 1, 2, 0.1, 209)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1016, 1, 1, 0.1, 202)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1017, 1, 5, 0.1, 203)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1018, 1, 1, 0.1, 201)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1019, 1, 1, 0.1, 205)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1020, 1, 2, 0.1, 206)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1021, 1, 1, 0.1, 207)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1022, 1, 6, 0.1, 208)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1023, 1, 4, 0.1, 209)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1024, 1, 2, 0.1, 203)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1025, 1, 1, 0.1, 204)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1026, 1, 4, 0.1, 202)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1026, 2, 1, 0.1, 209)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1026, 3, 2, 0.1, 208)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1026, 4, 1, 0.1, 205)
into lineitem (orderID, lineitemID, quantity, discount, product#)
values (1026, 5, 4, 0.1, 206)
select * from dual;

commit;