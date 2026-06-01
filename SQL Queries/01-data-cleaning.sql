-- Bellabeat Health & Behavioural Analytics Project
-- Author: Ved Shah
-- File: 01-data-cleaning.sql
-- Description: Data cleaning, validation, and quality checks performed on Bellabeat datasets.


-- Preview daily activity dataset
SELECT *
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`
LIMIT 10;


-- Check total rows and unique users
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Id) AS unique_users
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`;


-- Check for duplicate records
SELECT
  Id,
  activity_date,
  COUNT(*) AS duplicate_count
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`
GROUP BY Id, activity_date
HAVING COUNT(*) > 1;


-- Check date range in the dataset
SELECT
  MIN(activity_date) AS start_date,
  MAX(activity_date) AS end_date
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`;


-- Check for null values in important columns
SELECT
  COUNTIF(total_steps IS NULL) AS null_steps,
  COUNTIF(calories IS NULL) AS null_calories,
  COUNTIF(total_distance IS NULL) AS null_distance
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`;


-- Preview cleaned sleep dataset
SELECT *
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`
LIMIT 10;


-- Validate sleep dataset row count and users
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Id) AS unique_users
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`;