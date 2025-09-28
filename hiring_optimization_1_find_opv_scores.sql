--Combine tables for all years
CREATE OR REPLACE VIEW data_combined AS
SELECT 
    COALESCE(y2020.occupation, y2021.occupation, y2022.occupation, y2023.occupation, y2024.occupation) AS occupation,
    y2020.total AS total_2020,
    y2021.total AS total_2021,
    y2022.total AS total_2022,
    y2023.total AS total_2023,
    y2024.total AS total_2024
FROM da_data_2020_clean y2020
FULL OUTER JOIN da_data_2021_clean y2021 ON y2020.occupation = y2021.occupation
FULL OUTER JOIN da_data_2022_clean y2022 ON COALESCE(y2020.occupation, y2021.occupation) = y2022.occupation
FULL OUTER JOIN da_data_2023_clean y2023 ON COALESCE(y2020.occupation, y2021.occupation, y2022.occupation) = y2023.occupation
FULL OUTER JOIN da_data_2024_clean y2024 ON COALESCE(y2020.occupation, y2021.occupation, y2022.occupation, y2023.occupation) = y2024.occupation;

SELECT * FROM data_combined;

--Fix NULL values
DROP TABLE IF EXISTS data_combined_table;

CREATE TABLE data_combined_table AS
SELECT *
FROM data_combined;

UPDATE data_combined_table
SET total_2020 = 63644
WHERE occupation = 'Management, professional, and related occupations';

UPDATE data_combined_table
SET total_2021 = 64744
WHERE occupation = 'Management, professional, and related occupations';

UPDATE data_combined_table
SET total_2022 = 68099
WHERE occupation = 'Management, professional, and related occupations';

UPDATE data_combined_table
SET total_2023 = 70275
WHERE occupation = 'Management, professional, and related occupations';

UPDATE data_combined_table
SET total_2024 = 70744
WHERE occupation = 'Management, professional, and related occupations';

--Find OPV values
CREATE OR REPLACE VIEW opv_summary AS
SELECT 
  occupation,
  ROUND(((total_2021 - total_2020)*1.0 / ((total_2020 + total_2021)/2.0)), 6) AS opv_1,
  ROUND(((total_2022 - total_2021)*1.0 / ((total_2021 + total_2022)/2.0)), 6) AS opv_2,
  ROUND(((total_2023 - total_2022)*1.0 / ((total_2022 + total_2023)/2.0)), 6) AS opv_3,
  ROUND(((total_2024 - total_2023)*1.0 / ((total_2023 + total_2024)/2.0)), 6) AS opv_4,
  ROUND((
    (((total_2021 - total_2020)*1.0 / ((total_2020 + total_2021)/2.0)) +
     ((total_2022 - total_2021)*1.0 / ((total_2021 + total_2022)/2.0)) +
     ((total_2023 - total_2022)*1.0 / ((total_2022 + total_2023)/2.0)) +
     ((total_2024 - total_2023)*1.0 / ((total_2023 + total_2024)/2.0))
    ) / 4.0
  ), 6) AS avg_opv
FROM data_combined_table
WHERE occupation IN (
  'Management, business, and financial operations occupations',
  'Sales and related occupations',
  'Architecture and engineering occupations',
  'Life, physical, and social science occupations',
  'Lawyers',
  'Production, transportation, and material moving occupations'
);