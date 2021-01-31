-- Createt table containing number of employees retiring by title.
SELECT e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
left JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, title;

-- confirm retirement_titles was created
SELECT * FROM retirement_titles;

-- Use distinct on to remove duplicate rows and create unique_titles table.
SELECT DISTINCT ON (emp_no) emp_no,first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- confirm unique_titles was created
SELECT * FROM unique_titles;

-- Sum titles of retiring employees and create retiring_title table.
SELECT count(title), title
into retiring_title
from unique_titles
Group By title
order by count desc;

-- confirm retiring_title was created
SELECT * FROM retiring_title;


-- create a Mentorship Eligibility table that holds the employees program eligibility 
SELECT Distinct On(e.emp_no) e.emp_no, e.first_name, e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
Left outer Join dept_emp as de
on (e.emp_no = de.emp_no)
Left outer Join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
Order by e.emp_no;

-- confirm mentorship_eligibility was created
SELECT * FROM mentorship_eligibility;