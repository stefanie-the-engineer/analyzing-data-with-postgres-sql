--Query 1
SELECT a.emp_no, a.first_name, a.last_name, a.gender, b.salary
FROM employees a, salaries b
WHERE a.emp_no = b.emp_no
ORDER BY a.emp_no;

--Query 2
SELECT a.emp_no, a.first_name, a.last_name
FROM employees a
WHERE EXTRACT(year FROM hire_date) = 1986
ORDER BY a.emp_no;

--Query 3
SELECT a.dept_no, a.dept_name, b.emp_no, c.last_name, c.first_name, b.from_date, b.to_date
FROM departments a, dept_manager b, employees c
WHERE a.dept_no = b.dept_no AND b.emp_no = c.emp_no
ORDER BY a.dept_no;

--Query 4
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no AND b.dept_no = c.dept_no
ORDER BY a.emp_no;

--Query 5
SELECT *
FROM employees a
WHERE a.first_name = 'Hercules' AND a.last_name LIKE 'B%'
ORDER BY a.emp_no;

--Query 6
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no AND b.dept_no = c.dept_no AND c.dept_name = 'Sales'
ORDER BY a.emp_no;

--Query 7
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no AND b.dept_no = c.dept_no AND (c.dept_name = 'Sales' OR c.dept_name = 'Development')
ORDER BY a.emp_no;
	
--Query 8
SELECT a.last_name, COUNT(last_name) AS last_name_count
FROM employees a
GROUP BY a.last_name
ORDER BY COUNT(last_name) DESC;