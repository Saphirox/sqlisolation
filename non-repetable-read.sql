-- Non repetable read (Session 1)
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

-- Session (2)
UPDATE accounts SET Balance = Balance + 100 WHERE Email = 'suprmaks@gmail.com';
-- Session (2)

-- Session 1
SELECT * FROM accounts WHERE Email = 'suprmaks@gmail.com';
-- Expected 1000, Actual 1000
-- Session 1


-- Session (2)
COMMIT
-- Session (2)

-- Session 1
SELECT * FROM accounts WHERE Email = 'suprmaks@gmail.com';
-- Expected: 1000, Actual 1100
-- Session 1

COMMIT;