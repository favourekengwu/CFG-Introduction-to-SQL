-- drop database if exists FavsBeautyStores;
-- drop table if exists Customer;
-- drop table if exists Orders;
-- drop table if exists Items;
-- drop table if exists Employee;
-- drop table if exists FavsBeautyStore;

-- 1) Create DB diagram where all table relations are shown 

-- 2) Create relational DB pf your choice with minimum of 5 tables 

-- create a database called FavsBeautyStores

Create database FavsBeautyStores;

Use FavsBeautyStores;

Create table FavsBeautyStore(
    favsID int NOT NULL,
    FavsName char(100) NOT NULL,
    FavsLocation char(100),
    constraint pk_FavsBeautyStore_favsID primary key (favsID)
);

-- Populate the FavsBeautyStores table
Insert into FavsBeautyStore
(favsID, FavsName, FavsLocation)
values
(578932, 'FavsBeautyStore', 'London, United Kingdom');

select * from  FavsBeautyStore;

Create table Customer(
   customerID int NOT NULL,
    customerFirstName char(50) NOT NULL,
    customerSurname char(50) NOT NULL,
    customerDOB date NOT NULL,
    customerEmail varchar(200),
    customerPhoneNo varchar(14),
    customerAddress varchar(200),
    customerGender varchar(200),
    constraint pk_Customer_customerID primary key (customerID)
);


Insert into Customer
(customerID, customerFirstName, customerSurname, customerDOB, customerEmail, customerPhoneNo, customerAddress, customerGender)
values
(1, 'Chioma', 'Eze', '1998-02-10', 'chioma.eze@gmail.com', '070-8969-2431', '2 Prospect Hill, Doynton, BS30 3JZ, United Kingdom', 'Female'),
(2, 'Emeka', 'Arukwe', '2001-07-21', 'emeka.arukwe@yahoo.com', '070-5200-3729', '73 Iffley Road, Britannia, OL13 4ET, United Kingdom', 'Male'),
(3, 'Olamide', 'Adebayo', '1980-12-18', 'olamide.adebayo@gmail.com', '077-1078-6997', '40 Shannon Way, Chipstable, TA4 9XJ, United Kingdom', 'Male'),
(4, 'Adaeze', 'Uzoma', '2002-05-05', 'adaeze.uzoma@outlook.com', '079-1523-0444', '65 Roman Rd, Lelant, TR26 9FR, United Kingdom', 'Female'),
(5, 'Aminat', 'Diallo', '2001-03-10', 'aminat.diallo@gmail.com', '078-8936-2664', '96 Tadcaster Rd, Pikehall, DE4 1LE, United Kingdom', 'Female');

select * from  Customer;

Create table Employee(
    employeeID int NOT NULL,
    employeeFirstName char(50) NOT NULL,
    employeeSurname char(50) NOT NULL,
    employeeDOB date NOT NULL,
    employeeEmail varchar(50) NOT NULL,
    employeeStartDate date,  
    employeeSalary float,
    employeePosition varchar(50) NOT NULL,
    managerID int,
    favsID int NOT NULL,
    constraint pk_Employee_employeeID primary key (employeeID)-- ,
--     FOREIGN KEY (managerID) REFERENCES Employee(id)
);

-- constraint fk_Employee_managerID primary key (managerID)
--     REFERENCES Employee (managerID)

Insert into Employee
(employeeID, employeeFirstName, employeeSurname, employeeDOB, employeeEmail, employeeStartDate, employeeSalary, employeePosition, managerID, favsID)
values
(1001, 'Chiamaka', 'Abara', '1975-12-28', 'chiamaka.abara@mail.com', '2022-03-15', 20500.00, 'CEO', null, 578932),
(1002, 'Lola', 'Omobolanle', '1991-05-17', 'lola.omobolanle@mail.com', '2022-03-15', 19500.00, 'CFO', 1001, 578932),
(1003, 'Ijeoma', 'Ololade', '1986-08-06', 'ijeoma.ololade@mail.com', '2022-05-25', 18500.00, 'Head of Marketing', 1001, 578932),
(1004, 'Funmilayo', 'Kayode', '1980-11-17', 'funmilayo.kayode@mail.com', '2022-09-01', 7500.50, 'Shop Assitant', 1003, 578932),
(1005, 'Bosa', 'Joshua', '1973-02-20', 'bosa.joshua@mail.com', '2022-09-01', 7500.50, 'Shope Assitant', 1003, 578932);


select * from  Employee; 


Create table Orders(
    ordersID int NOT NULL,
    ordersDate date NOT NULL,
    ordersTime time, 
    ordersQuanity int NOT NULL,
    ordersPrice float NOT NULL,
    customerID int NOT NULL,
    employeeID int NOT NULL,
    constraint pk_Orders_ordersID primary key (ordersID),
    constraint fk_Orders_customerID foreign key (customerID) REFERENCES Customer (customerID),
    constraint fk_Orders_employeeID foreign key (employeeID) REFERENCES Employee (employeeID)
);

Insert into Orders
(ordersID, ordersDate, ordersTime, ordersQuanity, ordersPrice, customerID, employeeID)
values
(22129, '2022-11-15', '14:15:39', 2, 6.45, 1, 1004),
(22108, '2022-11-15', '10:00:11', 1, 13.15, 2, 1005),
(22147, '2022-11-14', '16:53:37', 1, 2.50, 3, 1003),
(22105, '2022-11-13', '09:18:00', 3, 13.24, 4, 1004),
(22003, '2022-11-12', '12:05:26', 5, 42.58, 5, 1002);

select * from  Orders;


Create table Items(
    itemsID int NOT NULL,
    itemsName char(100) NOT NULL,
    itemsPrice float NOT NULL,
    itemsDesc varchar(300),
    constraint pk_Item_itemsID primary key (itemsID)
);

insert into Items
(itemsID, itemsName, itemsPrice, itemsDesc)
values
(3908, 'Essentials', 2.50, '25 pcs hair bands'),
(4097, 'X-pression', 3.95, 'pre-stretched ultra braid hair extension'),
(2974, 'Shea Moisture', 13.15, 'coconut & rice shampoo'),
(2598, 'Palmers', 5.75, 'cocoa butter formula daily skin therapy'),
(2900, 'Vaseline', 2.99, 'lip therapy rosy lips'),
(3571, 'L.A. Girl', 4.50, 'pro conceal hd concealer'),
(2651, 'Ardell Natural', 7.35, ' dramatic fake lashes'),
(3032, 'Shea Moisture', 10.00, 'coconut & rice conditioner'),
(3108, 'Mielle', 7.58, 'hair oil treatment');

select * from  Items;

Create table OrderItem(
    orderitemID int NOT NULL,
    ordersID int NOT NULL,
    itemsID int NOT NULL,
    orderitemDate date NOT NULL,
    orderitemQuantity int NOT NULL,
    constraint pk_OrderItem_orderitemID primary key (orderitemID),
    constraint fK_OrderItem_ordersID foreign key (ordersID) REFERENCES Orders (ordersID),
    constraint fK_OrderItem_itemsID foreign key (itemsID) REFERENCES Items (itemsID)
);

Insert into OrderItem
(orderitemID, ordersID, itemsID, orderitemDate, orderitemQuantity)
values
(1, 22129, 3908, '2022-11-15', 2),
(2, 22129, 4097, '2022-11-15', 2),
(3, 22108, 2974, '2022-11-15', 1),
(4, 22147, 3908, '2022-11-14', 1),
(5, 22105, 2598, '2022-11-13', 3),
(6, 22105, 2900, '2022-11-13', 3),
(7, 22105, 3571, '2022-11-13', 3),
(8, 22003, 2651, '2022-11-12', 5),
(9, 22003, 3571, '2022-11-12', 5),
(10, 22003, 2974, '2022-11-12', 5),
(11, 22003, 3032, '2022-11-12', 5),
(12, 22003, 3108, '2022-11-12', 5);

select * from  OrderItem;

-- Query for the data 
Use FavsBeautyStores;

select * from  FavsBeautyStore;
select * from  Customer;
select * from  Orders;
select * from  Items;
select * from  Employee; 
select * from  orderItem; 
