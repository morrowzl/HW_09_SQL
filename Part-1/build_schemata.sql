-- schemata sql

drop table departments;
create table departments(
	dept_num varchar PRIMARY KEY,
	dept_name varchar
	);
SELECT * FROM departments;

DROP TABLE dept_emp;
create table dept_emp(
	emp_num bigint,
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
	dept_num varchar,
	FOREIGN KEY (dept_num) REFERENCES departments(dept_num),
	date_start date,
	date_stop date
	);
SELECT * FROM dept_emp;

DROP TABLE dept_mgr;
create table dept_mgr(
	dept_num varchar,
	FOREIGN KEY (dept_num) REFERENCES departments(dept_num),
	emp_num bigint,
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
	date_start date,
	date_stop date
	);
SELECT * FROM dept_mgr;

drop table employees;
create table employees(
	emp_num bigint PRIMARY KEY,
	date_birth date,
	name_first varchar,
	name_last varchar,
	gender varchar,
	date_hire date
	);
SELECT * FROM employees;

DROP TABLE salaries;
create table salaries(
	emp_num bigint,
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
	salary bigint,
	date_start date,
	date_stop date
	);
SELECT * FROM salaries;

drop table titles;
create table titles(
	emp_num bigint,
	FOREIGN KEY (emp_num) REFERENCES employees(emp_num),
	title varchar,
	date_start date,
	date_stop date
	);
SELECT * FROM titles;
	
select * from departments;
select * from dept_emp;
select * from dept_mgr;
select * from employees;
select * from salaries;
select * from titles;

DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_mgr;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;