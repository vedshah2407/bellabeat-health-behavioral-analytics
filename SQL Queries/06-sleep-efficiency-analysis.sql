-- Bellabeat Health & Behavioural Analytics Project
-- Author: Ved Shah
-- File: 06-sleep-efficiency-analysis.sql
-- Description: Sleep duration and efficiency analysis to identify wellness and recovery patterns.


-- Preview cleaned sleep dataset
SELECT *
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`
LIMIT 10;


-- Calculate overall average sleep metrics
SELECT
    ROUND(AVG(Sleep_Hours),2) AS avg_sleep_hours,

    ROUND(AVG(Sleep_Efficiency),2) AS avg_sleep_efficiency,

    ROUND(AVG(Total_Time_In_Bed)/60,2) AS avg_time_in_bed_hours

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`;


-- Analyze sleep duration distribution
SELECT
    CASE
        WHEN Sleep_Hours < 5 THEN 'Under 5 Hours'
        WHEN Sleep_Hours BETWEEN 5 AND 6.99 THEN '5-7 Hours'
        WHEN Sleep_Hours BETWEEN 7 AND 8.99 THEN '7-9 Hours'
        ELSE '9+ Hours'
    END AS sleep_duration_group,

    COUNT(*) AS total_records

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`

GROUP BY sleep_duration_group
ORDER BY total_records DESC;


-- Analyze relationship between time in bed and sleep efficiency
SELECT
    ROUND(AVG(Total_Time_In_Bed)/60,2) AS avg_time_in_bed_hours,

    ROUND(AVG(Sleep_Efficiency),2) AS avg_sleep_efficiency

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`;


-- Identify low sleep efficiency outliers
SELECT
    Id,
    Sleep_Date,
    Sleep_Hours,
    Sleep_Efficiency

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`

WHERE Sleep_Efficiency < 80

ORDER BY Sleep_Efficiency ASC;


-- Analyze average sleep efficiency by user
SELECT
    Id,

    ROUND(AVG(Sleep_Hours),2) AS avg_sleep_hours,

    ROUND(AVG(Sleep_Efficiency),2) AS avg_sleep_efficiency

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_sleep_day`

GROUP BY Id

ORDER BY avg_sleep_efficiency DESC;