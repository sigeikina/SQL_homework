--1. List the following details of each employee: employee number,
--last name, first name, sex, salary.
SELECT employees.emp_no,
       employees.last_name,
	   employees.first_name,
	   employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no;

--2. List first name, last name and hire date for employees
-- who where hired in 1986.
SELECT employees.last_name,
       employees.first_name, 
	   employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following info:
--department no, department name, manager's employee number, last name, first name.
SELECT dep_manager.dep_no,
       departments.dep_name,
	   employees.last_name,
	   employees.first_name,
	   dep_manager.emp_no
FROM dep_manager
JOIN departments ON dep_manager.dep_no=departments.dep_no
JOIN employees ON dep_manager.emp_no=employees.emp_no;

--4. List the department of each employee with the following info:
-- employee no, last name, first name, department name.
SELECT employees.emp_no,
       employees.last_name,
	   employees.first_name,
	   departments.dep_name
FROM employees 
INNER JOIN dep_emp ON dep_emp.emp_no=employees.emp_no
INNER JOIN departments ON  departments.dep_no=dep_emp.dep_no
ORDER BY departments.dep_name;

--5. List first name, last name, sex for employees whose
--first name is "Hercules" and last name begin with "B".
SELECT employees.first_name,
       employees.last_name,
	   employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;

--6. List all employees in the Sales department, including their
--employee number, last name, first name, department name.
SELECT employees.emp_no,
       employees.last_name,
	   employees.first_name,
	   departments.dep_name
FROM employees
INNER JOIN dep_emp ON dep_emp.emp_no=employees.emp_no
INNER JOIN departments ON dep_emp.dep_no=departments.dep_no
WHERE departments.dep_name = 'Sales';

--7. List all employees in the Sales and Development departments, including
-- thier emloyee number, last name, first name, department name.
SELECT employees.emp_no,
       employees.last_name,
	   employees.first_name,
	   departments.dep_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
INNER JOIN departments ON departments.dep_no = dep_emp.dep_no
WHERE departments.dep_name = 'Sales' OR departments.dep_name = 'Development'
ORDER BY Departments.dep_name;

--8. In descending order, list the frequency count of employee last names,
--i.e. how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM Employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;






