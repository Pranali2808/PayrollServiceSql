---//UC1:create payroll sservice database----------------------------
create database Payroll_Service;
use Payroll_Service;
---//UC2: create employee payroll table------------------------------
create table Employee_Payroll(
Id int identity(1,1) primary key,
Name varchar(100),
Salary float,
StartDate date);
---//UC3:create employee payroll data in database---------------
Insert into Employee_Payroll(Name, Salary, StartDate) 
values ('Pranali', 25678, '2010-03-23'),
('Pushkar', 28978, '2013-04-03'),
('Payal', 35678, '2015-12-23'),
('Karan', 45678, '2022-08-23');
---//UC4:retriew data from database--------------------
select * from employee_payroll;
---//UC5:ability to retriew specific data----------------------
select salary from employee_payroll where Name = 'Karan';
select * from employee_payroll where StartDate between cast ('2010-01-01' as date) and GETDATE();
---//UC6:ability to add gender-------------------
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender = 'F' where Id in (1,3);
update employee_payroll set Gender = 'M' where Id in (2,4);
---//UC7:find sum,avg,min,max and no of male and female employees-----------------------------
select sum(Salary) as sumsalary,Gender from employee_payroll group by Gender;
select avg(Salary) as avgsalary,Gender from employee_payroll group by Gender; 
select max(Salary) as maxsalary,Gender from employee_payroll group by Gender; 
select min(Salary) as minsalary,Gender from employee_payroll group by Gender; 
select count(Name) as EmployeeCount,Gender from employee_payroll group by Gender;  
---//UC8:extend payroll data to store phone ,address,dept--------------------------------
select * from employee_payroll;
alter table employee_payroll add Phone bigint;
update employee_payroll set Phone = 9876543245; 
update employee_payroll set Phone = 8907654321 where ID IN (1,2); 
alter table employee_payroll add Address varchar(100) not null default 'Pune';
alter table employee_payroll add Department varchar(250) default 'IT';
---//UC9:extend table to have basic pay,deduction,taxable pay,income tax,net pay------------------------
exec sp_rename 'employee_payroll.salary','Basic_pay','column';
alter table employee_payroll add
 Deductions float not null default 0.00,
 Taxable_Pay float not null default 0.00, 
 Income_Tax float not null default 0.00,
 Net_Pay float not null default 0.00;
update employee_payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
select * from employee_payroll;
---//UC10:abilty to make one employee as part of two dept----------------------------------
insert into employee_payroll (Name, Basic_pay, StartDate, Gender, Phone, Address, Department, Deductions, Taxable_Pay, Income_Tax,Net_pay)
					  values ('Payal', 80000.00, '2022-01-01', 'F', 8899776655, 'Nashik', 'CS',2000.00, 62000.00, 3000.00 );
update employee_payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
---//UC11:ER diagram---------------------
create table Department
(
Dept_Id int identity (1,1) primary key,
Emp_Id int foreign key references employee_payroll(Id),
Department varchar(100)
);
---//UC12:drop table department---------------------------------
insert into employee_payroll (Name, Basic_pay, StartDate, Gender, Phone, Address, Department, Deductions, Taxable_Pay, Income_Tax,Net_pay)
					  values ('Payal', 80000.00, '2022-01-01', 'F', 8899776655, 'Nashik', 'CS',2000.00, 62000.00, 3000.00,0);
update employee_payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
-----//Stored Procedure//--------------------------------------------------------------
CREATE PROCEDURE spAddEmployees

@Name varchar(100),
@Startdate Date,
@Gender char(1),
@Phone bigint,
@Department varchar(100),
@Address varchar(100),
@Basic_Pay float,
@Deductions float,
@Taxable_pay float,
@Income_tax float,
@Net_pay float
as
insert into employee_payroll (Name, Startdate, Gender, Phone, Address, Department, Basic_Pay, Deductions, Taxable_pay, Income_tax, Net_pay)
	values(@Name, @Startdate, @Gender, @Phone, @Address, @Department, @Basic_Pay, @Deductions, @Taxable_pay, @Income_tax, @Net_pay);

