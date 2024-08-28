-------------- DIRTY READ --------------

-- Base case
UPDATE accounts SET Balance = 1000 WHERE Email = 'suprmaks@gmail.com';

-- Dirty Read (Session 1)
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;

-- Start Session (2)
UPDATE accounts SET Balance = Balance + 100 WHERE Email = 'suprmaks@gmail.com';
ROLLBACK;
-- End Session (2)

SELECT * FROM accounts WHERE Email = 'suprmaks@gmail.com';
-- Expected: 1000, Actual 1100

COMMIT;

