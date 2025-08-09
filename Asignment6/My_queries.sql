
-- finding 3 second lowest salary from employee table


SELECT * FROM `employee` ORDER BY salary ASC LIMIT 3 OFFSET 1;




-- finding second lowest salary using sub query


SELECT * FROM employee WHERE salary= (SELECT DISTINCT(salary) FROM 
employee ORDER BY salary ASC LIMIT 1 OFFSET 1);





-- find pending balance from account table where result fulfill following conditions
-- a. show average pending balance
-- b. account should be active
-- c. grouping should be on open branch id
-- d. the branches on where PENDING_BALANCE is bellow 4300


SELECT OPEN_BRANCH_ID,AVG(`PENDING_BALANCE`) 
AS avg_pending_balance FROM account 
WHERE STATUS = 'ACTIVE' GROUP BY OPEN_BRANCH_ID 
HAVING AVG(`PENDING_BALANCE`) < 4300;



SELECT OPEN_BRANCH_ID,`PENDING_BALANCE` FROM account 
WHERE STATUS = 'ACTIVE' GROUP BY OPEN_BRANCH_ID 
HAVING AVG(`PENDING_BALANCE`) < 4300;





-- pagination query and explain


SELECT * FROM `account` LIMIT 5;

-- explain : first page  This will pick first  5 data.




SELECT * FROM `account` LIMIT 5 OFFSET 5;

-- explain : second page This will skip first 5 data pick next 5 value.





-- Think you have a bank and many branches . You have a account table where multiple account from multiple branch.
-- table contains OPEN_BRANCH_ID . Write a query to find total number of branch including head branch


SELECT COUNT(DISTINCT(OPEN_BRANCH_ID)) AS total_branch_number FROM account;
