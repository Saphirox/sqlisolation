# Set monitor
SET GLOBAL innodb_status_output=ON;
SET GLOBAL innodb_status_output_locks=ON;

# Seeding
CREATE DATABASE sample;
USE sample;
CREATE TABLE accounts (
                       Id INT AUTO_INCREMENT PRIMARY KEY,
                       Email VARCHAR(50) NOT NULL UNIQUE,
                       Balance INT NOT NULL
);

INSERT INTO accounts (Email,Balance)
VALUES ('suprmaks@gmail.com', 1000);