CREATE TABLE titles(
    title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);
SELECT * FROM titles;

CREATE TABLE employees(
    emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) references titles(title_id)
);
SELECT * FROM employees;

CREATE TABLE departments(
    dep_no VARCHAR NOT NULL,
	dep_name VARCHAR NOT NULL,
	PRIMARY KEY (dep_no)
);
SELECT * FROM departments;

CREATE TABLE dep_emp(
	emp_no INTEGER NOT NULL,
	dep_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dep_no) references departments(dep_no),
	PRIMARY KEY (emp_no, dep_no)
);
SELECT * FROM dep_emp;

CREATE TABLE dep_manager(
	dep_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dep_no) references departments(dep_no),
	PRIMARY KEY (emp_no, dep_no)
);
SELECT * FROM dep_manager;

CREATE TABLE salaries(
    emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	PRIMARY KEY (emp_no)
);
SELECT * FROM departments;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1087-01-01';

--3. List the manager of each department with the following information: department number, departmentt name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dep_no, department.dep_name, dep_manager.emp_no, employees.last_name, employees.first_name, dep_manager.from_date, dep_manager.to_date
FROM departments
JOIN dep_manager
ON departments.dep_no = dep_manager.dep_no
JOIN employees
ON dep_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dep_


