-- Bellabeat Health & Behavioural Analytics Project
-- Author: Ved Shah
-- File: 02-data-validation.sql
-- Description: Dataset validation and relationship checks between sleep and activity data.


-- Validate sleep dataset structure
SELECT
  COUNT(*) AS total_sleep_rows,
  COUNT(DISTINCT Id) AS unique_sleep_users,
  MIN(Sleep_Date) AS earliest_sleep_date,
  MAX(Sleep_Date) AS latest_sleep_date
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`;


-- Validate daily activity dataset structure
SELECT
  COUNT(*) AS total_activity_rows,
  COUNT(DISTINCT Id) AS unique_activity_users,
  MIN(activity_date) AS earliest_activity_date,
  MAX(activity_date) AS latest_activity_date
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`;


-- Check matching records between sleep and activity datasets
SELECT
  COUNT(*) AS matching_records
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day` s
INNER JOIN `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity` d
ON CAST(s.Id AS STRING) = CAST(d.Id AS STRING)
AND DATE(s.Sleep_Date) = DATE(d.activity_date);


-- Identify sleep records without matching activity data
SELECT
  s.Id,
  s.Sleep_Date
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day` s
LEFT JOIN `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity` d
ON CAST(s.Id AS STRING) = CAST(d.Id AS STRING)
AND DATE(s.Sleep_Date) = DATE(d.activity_date)
WHERE d.Id IS NULL
LIMIT 20;


-- Check for abnormal sleep duration values
SELECT
  Id,
  SleepHours,
  SleepEfficiency
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`
WHERE SleepHours < 2
   OR SleepHours > 14
ORDER BY SleepHours;


-- Validate calorie burn distribution
SELECT
  MIN(calories) AS minimum_calories,
  MAX(calories) AS maximum_calories,
  ROUND(AVG(calories),2) AS average_calories
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`;