-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
-- analysis queries

-- ------------------------------------
-- START

-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

-- SELECT employees.emp_num, 
-- 	   employees.name_last, 
-- 	   employees.name_first, 
-- 	   employees.gender, 
-- 	   salaries.salary
-- FROM employees
-- LEFT JOIN salaries on
-- employees.emp_num=salaries.emp_num;
SELECT employees.emp_num, employees.name_last, employees.name_first, employees.gender, salaries.salary
FROM salaries
FULL JOIN employees on
employees.emp_num=salaries.emp_num
ORDER BY employees.emp_num;

-- STOP
-- ------------------------------------
-- START

-- List employees who were hired in 1986.

SELECT emp_num, date_hire
FROM employees
WHERE date_part('year',date_hire) = 1986;

-- NOTE: approach based on example found at:
-- https://www.postgresql.org/message-id/39527922.D0C8E9F2%40austin.rr.com

-- STOP 
-- ------------------------------------
--START

-- List the manager of each department with the following information: 
--   department number, department name, the manager's employee number,
--   last name, first name, and start and end employment dates.

SELECT departments.dept_num, departments.dept_name, dept_mgr.emp_num, employees.name_last, employees.name_first, dept_mgr.date_start, dept_mgr.date_stop
FROM dept_mgr
LEFT JOIN departments on
departments.dept_num=dept_mgr.dept_num
LEFT JOIN employees on
employees.emp_num=dept_mgr.emp_num
WHERE date_part('year',date_stop) = 9999;

-- STOP 
-- ------------------------------------
--START

-- List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.

SELECT employees.emp_num, employees.name_last, employees.name_first, departments.dept_name
FROM employees
LEFT JOIN dept_emp 
ON dept_emp.emp_num=employees.emp_num
FULL JOIN departments
ON departments.dept_num=dept_emp.dept_num
ORDER BY employees.emp_num;

-- STOP 
-- ------------------------------------
--START

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT name_first, name_last
FROM employees
WHERE name_first = 'Hercules'
	AND name_last LIKE 'B%';
	
-- STOP 
-- ------------------------------------
--START

-- List all employees in the Sales department, including their employee number, 
--   last name, first name, and department name.

SELECT employees.emp_num, employees.name_last, employees.name_first, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_num=employees.emp_num
FULL JOIN departments
ON departments.dept_num=dept_emp.dept_num
WHERE departments.dept_name = 'Sales';

-- STOP 
-- ------------------------------------
--START

-- List all employees in the Sales and Development departments, 
--   including their employee number, last name, first name, and department name.

SELECT employees.emp_num, employees.name_last, employees.name_first, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_num=employees.emp_num
FULL JOIN departments
ON departments.dept_num=dept_emp.dept_num
WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development';

-- STOP 
-- ------------------------------------
--START

-- In descending order, list the frequency count of employee last names, 
--   i.e., how many employees share each last name.

SELECT name_last, COUNT(name_last) AS "name count"
FROM employees
GROUP BY name_last
ORDER BY "name count" DESC;

-- STOP 
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------