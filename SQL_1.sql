SELECT salary
FROM (
    SELECT salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employee_table
) AS ranked_salaries
WHERE salary_rank = 3;

