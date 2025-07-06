create database depDB;
use depDB;
create table employees(
employee_id integer primary key,
emname text,
dep_id integer, 
salary real);

create table departments(
dep_id integer primary key,
dep_name text, 
location text
);

insert into employees (employee_id, emname, dep_id, salary) values
(101, 'Alice', 1, 75000), 
(102, 'Bob', 1, 55000),
(103, 'Charlie', 2, 120000),
(104, 'Diana', 2, 110000),
(105, 'Ethan', 3, 60000),
(106, 'Fiona', 3, 58000),
(107, 'George', 4, 70000),
(108, 'Helen', 4, 72000),
(109, 'Ian', 2, 105000),
(110, 'Jane', 1, 50000);

insert into departments (dep_id, dep_name, location) values
(1, 'Sales', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'HR', 'New York'),
(4, 'Marketing', 'Chicago');

/*procedure*/
DELIMITER //

create procedure GetEmployeesbyDepartment(in p_DepartmentID integer)
begin 
	if p_DepartmentID is null then
		SELECT 'DepartmentID is required.' AS Message;
	else
        select employee_id, emname
        from employees
        where dep_id=p_DepartmentID;
	end if;
End;
//
DELIMITER ;

call GetEmployeesbyDepartment(2);

/* Function*/

DELIMITER //
create function GetEmployeeSalary(p_employeeid int)
returns decimal(10, 2)
deterministic
begin
	declare empsalary decimal(10,2);
    
    select salary into empsalary
    from employees
    where employee_id= p_employeeid;
    
    if empsalary is null then
		set empsalary=0;
	end if;
    return empsalary;
end;
//
DELIMITER ;

select GetEmployeeSalary(102);