--Create tables and import cleaned data for each year

--2020
DROP TABLE IF EXISTS da_data_2020_clean;
CREATE TABLE da_data_2020_clean (
    occupation TEXT,
    total INT
);
COPY da_data_2020_clean (occupation, total)
FROM 'C:/temp/DA_data_2020_clean.csv'
DELIMITER ',' CSV HEADER;

--2021
DROP TABLE IF EXISTS da_data_2021_clean;
CREATE TABLE da_data_2021_clean (
    occupation TEXT,
    total INT
);
COPY da_data_2021_clean (occupation, total)
FROM 'C:/temp/DA_data_2021_clean.csv'
DELIMITER ',' CSV HEADER;

--2022
DROP TABLE IF EXISTS da_data_2022_clean;
CREATE TABLE da_data_2022_clean (
    occupation TEXT,
    total INT
);
COPY da_data_2022_clean (occupation, total)
FROM 'C:/temp/DA_data_2022_clean.csv'
DELIMITER ',' CSV HEADER;

--2023
DROP TABLE IF EXISTS da_data_2023_clean;
CREATE TABLE da_data_2023_clean (
    occupation TEXT,
    total INT
);
COPY da_data_2023_clean (occupation, total)
FROM 'C:/temp/DA_data_2023_clean.csv'
DELIMITER ',' CSV HEADER;

--2024
DROP TABLE IF EXISTS da_data_2024_clean;
CREATE TABLE da_data_2024_clean (
    occupation TEXT,
    total INT
);
COPY da_data_2024_clean (occupation, total)
FROM 'C:/temp/DA_data_2024_clean.csv'
DELIMITER ',' CSV HEADER;

SELECT COUNT(*) FROM da_data_2020_clean;
SELECT COUNT(*) FROM da_data_2021_clean;
SELECT COUNT(*) FROM da_data_2022_clean;
SELECT COUNT(*) FROM da_data_2023_clean;
SELECT COUNT(*) FROM da_data_2024_clean;