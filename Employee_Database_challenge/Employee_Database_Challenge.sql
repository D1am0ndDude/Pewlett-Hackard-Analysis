SELECT e.emp_no,
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO emp_data
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM emp_data;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO clean_emp_data
FROM emp_data
ORDER BY emp_no, title DESC;

SELECT * FROM clean_emp_data;

SELECT COUNT(cl.emp_no),
cl.title
INTO retiring_titles
FROM clean_emp_data AS cl
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;
