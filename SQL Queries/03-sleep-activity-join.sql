-- Bellabeat Health & Behavioural Analytics Project
-- Author: Ved Shah
-- File: 03-sleep-activity-join.sql
-- Description: Join analysis between sleep and activity datasets to evaluate overlapping behavioral records.


-- Create merged sleep and activity table
CREATE OR REPLACE TABLE `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_activity` AS

SELECT
    s.Id,
    s.Sleep_Date,
    s.Sleep_Hours,
    s.Sleep_Efficiency,
    s.Total_Minutes_Asleep,
    s.Total_Time_In_Bed,

    d.total_steps,
    d.calories,
    d.sedentary_minutes,
    d.very_active_minutes,
    d.fairly_active_minutes,
    d.lightly_active_minutes,
    d.total_distance

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day` s

INNER JOIN `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity` d

ON CAST(s.Id AS STRING) = CAST(d.Id AS STRING)

AND DATE(s.Sleep_Date) = DATE(d.activity_date);


-- Check total overlapping records after join
SELECT
    COUNT(*) AS total_matching_rows
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_activity`;


-- Analyze relationship between sleep hours and daily steps
SELECT
    ROUND(AVG(Sleep_Hours),2) AS avg_sleep_hours,
    ROUND(AVG(total_steps),2) AS avg_daily_steps
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_activity`;


-- Analyze average calories burned for matched users
SELECT
    ROUND(AVG(calories),2) AS avg_calories_burned
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_activity`;


-- Identify date overlap issue between sleep and activity datasets
SELECT
    MIN(Sleep_Date) AS sleep_start_date,
    MAX(Sleep_Date) AS sleep_end_date
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`;

SELECT
    MIN(activity_date) AS activity_start_date,
    MAX(activity_date) AS activity_end_date
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`;