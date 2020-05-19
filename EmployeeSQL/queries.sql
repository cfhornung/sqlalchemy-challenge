-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.gender,
        sal.salary
FROM employees as emp
LEFT JOIN salaries as sal
ON (emp.emp_no = sal.emp_no);

-- 2. List employees who were hired in 1986.
SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT  man.dept_no,
        dept.dept_name,
        man.emp_no,
        employ.last_name,
        employ.first_name,
        man.from_date,
        man.to_date
FROM dept_manager AS man
INNER JOIN departments AS dept
ON (man.dept_no = dept.dept_no)
INNER JOIN employees AS employ
ON (man.emp_no = employ.emp_no);

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT  em.emp_no,
        em.last_name,
        em.first_name,
        dep.dept_name
FROM employees AS em
INNER JOIN dept_emp AS d
ON (em.emp_no = d.emp_no)
INNER JOIN departments AS dep
ON (d.dept_no = dep.dept_no);


-- 5. List all employees whose first name is "Hercules" and 
-- last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT  ploy.emp_no,
        ploy.last_name,
        ploy.first_name,
        de.dept_name
FROM employees AS ploy
INNER JOIN dept_emp AS dee
ON (ploy.emp_no = dee.emp_no)
INNER JOIN departments AS de
ON (dee.dept_no = de.dept_no)
WHERE de.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT  eee.emp_no,
        eee.last_name,
        eee.first_name,
        d.dept_name
FROM employees AS eee
INNER JOIN dept_emp AS deee
ON (eee.emp_no = deee.emp_no)
INNER JOIN departments AS d
ON (deee.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;