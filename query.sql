-- 1) Create DB diagram where all table relations are shown 

-- 2) Create relational DB pf your choice with minimum of 5 tables 

Use FavsBeautyStores;

-- altering the table to add a foreign keyy
alter table employee
add foreign key (managerID) references employee(employeeid);

select *  
from customer;

select *  
from employee;

select *  
from orders;

-- select from the order table the order date, employee ID and customer ID where the ordeer date is 2022-11-15
select ord.ordersDate, ord.customerID, ord.employeeID
from orders ord
where ord.ordersDate = '2022-11-15';

-- select from order table where employeeID is not dublicated 
select distinct ord.employeeID
from orders ord
where ord.employeeID > 1002;

-- Count how many employee ID are in the order table and group them by employee
select count(ord.employeeID), ord.employeeID
from orders ord
group by ord.employeeID;


-- 3) Prepare an example query with a subquery to demonstrate how to extract data from your DB for anaysis

-- Finding which employee served what order to which customer

select ord.ordersDate, ord.customerID, ord.employeeID
from orders ord
where ord.customerID in ( select ord.customerID
					from orders ord
					where ord.ordersID = 22105);
                    
-- 4) Using any type of join create a view that combines mutible tables in a logical way 

-- Show employees that have managers 
select e1.employeeFirstName, e1.employeeSurName, e2.employeeFirstName as 'Manager First Name', e2.employeeSurName as 'Manager Last Name'
from Employee e1
inner join 
Employee e2
on
e1.managerID = e2.employeeID;

-- Create a view for employees that have managers 
create view vw_managedEmployee
as
	select e1.employeeFirstName, e1.employeeSurName, e2.employeeFirstName as 'Manager First Name', e2.employeeSurName as 'Manager Last Name'
	from Employee e1
	inner join 
	Employee e2
	on
	e1.managerID = e2.employeeID;


select *
from vw_managedEmployee;

drop view orderpricePerorderQuantity;
CREATE VIEW orderpricePerorderQuantity AS
	SELECT ordersPrice, ordersQuanity
		DIV( ordersQuanity/ordersPrice)
	FROM orders
    GROUP by ordersPrice
    ORDER BY ordersPrice DESC;
 
select *
from orderpricePerorderQuantity;


select c.customerID, c.customerFirstName as 'First Name', c.customerSurName as 'Last Name', ord.ordersID, ord.ordersDate, ord.ordersQuanity, ord.employeeID
from customer c
right join orders ord
on c.customerID = ord.customerID;


select c.customerID, c.customerFirstName as 'First Name', c.customerSurName as 'Last Name', ord.ordersID, ord.ordersDate, ord.ordersQuanity, ord.employeeID, em.employeeID, em.employeeFirstName as 'Employee First Name'
from customer c
join orders ord
on c.customerID = ord.customerID
left join employee em
on ord.employeeID = em.employeeID;


-- 5) In your database, create a stored function that can be applied to a query in your DB
CREATE DEFINER=`root`@`localhost` FUNCTION `gb_to_naira`(ordersPrice float) RETURNS float
    DETERMINISTIC
BEGIN
RETURN (ordersPrice*746);
END

select gb_to_naira(ordersPrice)
from orders;

-- 6) In your database, create a stored procedure and demonstrate how it runs in your DB
CREATE PROCEDURE `GetCustomerPhoneNo`()
BEGIN
select customerFirstName, customerSurName, customerPhoneNo from customer;
END

call GetCustomerPhoneNo;

-- 7 prepare an example query with group by and having to demnstrate hoow to extract data from your DB for anaysis
select c.customerGender, count(c.customerGender)
from customer c
group by c.customerGender
order by c.customerGender desc;

-- create a student table using the employee table
create table students as (select * from employee);
select * from students;

-- create a student1 table using the employee table selecting just the ID, first name, last name, DOB, and email. 
create table students1 as (select employeeID, employeeFirstName, employeeSurname, employeeDOB, employeeEmail from employee);
select * from students1;
-- rename the the employee id and first name colum to student id and first name temporaryly 
select employeeID as students1ID, employeeFirstName as students1FirstName, employeeSurname, employeeDOB, employeeEmail from students1;

-- rename the the employee id and first name colum to student id and first name permenently 
alter table students1
rename column employeeID to students1ID,
rename column employeeFirstName to students1FirstName;

-- create a student1 table using the employee table selecting just the ID, first name, last name, DOB, and email, rename the entire colum to students. 
create table students2 as (select employeeID as students2ID, employeeFirstName as students2FirstName, employeeSurname as students2Surname from employee);
select * from students2;
