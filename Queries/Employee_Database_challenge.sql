-- Use Dictinct with Orderby to remove duplicate rows for retirement titles list
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
INNER JOIN departments as d
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') ORDER BY e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows for unique titles list
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--Use Count with GroupBy and OrderBy for retiring titles list
SELECT COUNT(rt.emp_no), rt.title
INTO retiring_titles
FROM retirement_titles as rt
LEFT JOIN unique_titles as ut
ON rt.emp_no = ut.emp_no
GROUP BY rt.title
ORDER BY rt.count DESC

-- Use Dictinct with Orderby to remove duplicate rows for mentorship elig. list
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') ORDER BY e.emp_no