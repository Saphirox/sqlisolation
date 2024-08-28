-- Lost update 

-- Base case
UPDATE accounts SET Balance = 1000 WHERE Email = 'suprmaks@gmail.com';

SET autocommit=0;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

-- Session 1
SELECT * FROM accounts WHERE Email = 'suprmaks@gmail.com';
-- Session 1

-- Session 2
UPDATE accounts SET Balance = Balance + 100 WHERE Email = 'suprmaks@gmail.com';
COMMIT
-- Session 2

-- Session 1
UPDATE accounts SET Balance = Balance - 200 WHERE Email = 'suprmaks@gmail.com';
-- Session 1

-- Expected = 900, Actual 800. The first transaction does not count changed value from 2 transaction

COMMIT;

-- Solution: Serializable isolation level
