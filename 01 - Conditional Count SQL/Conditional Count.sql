
SELECT mike_table.month, (mike_count + jon_count) as total_count, (mike_amount + jon_amount) as total_amount, mike_count, mike_amount, jon_count, jon_amount
FROM
(SELECT EXTRACT(MONTH from payment_date) as month, COUNT(customer_id) as mike_count, SUM(amount) as mike_amount
FROM payment
WHERE staff_id = 1
GROUP BY EXTRACT(MONTH from payment_date)) as mike_table
FULL OUTER JOIN
(SELECT EXTRACT(MONTH from payment_date) as month, COUNT(customer_id) as jon_count, SUM(amount) as jon_amount
FROM payment
WHERE staff_id = 2
GROUP BY EXTRACT(MONTH from payment_date)) as jon_table
ON mike_table.month = jon_table.month
ORDER BY mike_table.month;
