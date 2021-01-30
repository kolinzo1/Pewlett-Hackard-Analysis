-- Module 7 Challenge
-- create a Retirement Titles table
SELECT e.emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- number of employees by their most recent job title who are about to retire
SELECT COUNT (DISTINCT title)
FROM unique_titles;

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title ORDER BY COUNT(emp_no) DESC;

-- create a Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no, first_name, last_name, birth_date,
	de.from_date, de.to_date, title
INTO mentorship_eligibility
FROM employees AS e
LEFT JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
LEFT JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no, to_date DESC;