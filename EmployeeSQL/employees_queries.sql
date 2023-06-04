--List employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no;

--List last name, first name, and hire date for 1986 hires
SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List dept number, dept name, employee number, last name, and first name of each department manager
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no=departments.dept_no
JOIN employees ON employees.emp_no=dept_manager.emp_no;

--List each employees dept. number, employee number, last name, first name and dept. name
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp ON departments.dept_no=dept_emp.dept_no
JOIN employees ON dept_emp.emp_no=employees.emp_no;

--List the first name, last name, and sex of each employee name 'Hercules' with a 'B' last name
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Herucles' AND last_name LIKE 'B%';

--List employees in the Sales dept with their employee number, last name, and first name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--List employees in the Sales and Development dept with their employee number, last name, and first name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales' AND departments.dept_name = 'Development';

--List the frequency counts, in decending order, of all employee last names
SELECT employees.last_name, COUNT(employees.last_name) AS last_name_count
FROM employees
GROUP BY employees.last_name
ORDER BY last_name_count DESC;