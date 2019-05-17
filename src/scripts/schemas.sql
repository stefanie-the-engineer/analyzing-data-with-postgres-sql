CREATE DATABASE company
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8';
    
CREATE TABLE departments (
	dept_no VARCHAR(8) PRIMARY KEY,
  	dept_name VARCHAR(64) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
  	birth_date DATE NOT NULL,
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	gender VARCHAR(8),
	hire_date DATE NOT NULL
);

CREATE TABLE titles(
	emp_no INT,
    title VARCHAR(64) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);

CREATE TABLE salaries(
	emp_no INT,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(8),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no),
	CONSTRAINT dept_no FOREIGN KEY (dept_no)
        REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(8),
	emp_no INT,
	from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	CONSTRAINT dept_no FOREIGN KEY (dept_no)
        REFERENCES departments (dept_no),
    CONSTRAINT emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);

