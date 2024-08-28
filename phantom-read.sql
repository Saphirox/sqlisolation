SET autocommit=0;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

-- Session 2
INSERT INTO accounts (Email,Balance)
VALUES ('suprmaks+3@gmail.com', 2000);
-- Session 2

-- Session 1
SELECT * FROM accounts WHERE Balance > 900;
-- Session 1

-- Session 2
ROLLBACK
-- Session 2

-- Expected: 1 record from the seeding, Actual: 2 records

COMMIT;