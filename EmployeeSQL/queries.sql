--  1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e 
INNER JOIN salaries AS s 
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '$1986-01-01' AND '$1986-12-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments AS d
INNER JOIN dept_manager AS m 
	ON m.dept_no = d.dept_no
INNER JOIN employees AS e
	ON e.emp_no = m.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dpe
	ON dpe.emp_no = e.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dpe.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name ='Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dpe
	ON dpe.emp_no = e.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dpe.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dpe
	ON dpe.emp_no = e.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dpe.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY 4;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

-- Epilogue 
-- Evidence in hand, you march into your boss's office and present the visualization. 
-- With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." 
-- You look down at your badge to see that your employee ID number is 499942.
SELECT *
FROM employees 
WHERE emp_no = 499942;

-- Salary for employee number 499942: 
SELECT e.emp_no, e.first_name, e.last_name, e.sex, e.hire_date, s.salary
FROM employees AS e
INNER JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE e.emp_no = 499942;