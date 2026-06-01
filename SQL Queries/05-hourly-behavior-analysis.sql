-- Bellabeat Health & Behavioural Analytics Project
-- Author: Ved Shah
-- File: 05-hourly-behavior-analysis.sql
-- Description: Hourly behavioral trend analysis to identify activity peaks, calorie burn timing, and engagement patterns.


-- Analyze average calories burned by hour
SELECT
    activity_hour,
    ROUND(AVG(calories),2) AS avg_calories_burned
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_calories`
GROUP BY activity_hour
ORDER BY activity_hour;


-- Analyze average step count by hour
SELECT
    activity_hour,
    ROUND(AVG(step_total),2) AS avg_hourly_steps
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_steps`
GROUP BY activity_hour
ORDER BY activity_hour;


-- Analyze average intensity by hour
SELECT
    activity_hour,
    ROUND(AVG(total_intensity),2) AS avg_intensity
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_intensities`
GROUP BY activity_hour
ORDER BY activity_hour;


-- Identify peak activity hours based on intensity
SELECT
    activity_hour,
    ROUND(AVG(total_intensity),2) AS avg_intensity
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_intensities`
GROUP BY activity_hour
ORDER BY avg_intensity DESC
LIMIT 5;


-- Compare weekday vs weekend calorie burn behavior
SELECT
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM activity_hour) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,

    ROUND(AVG(calories),2) AS avg_calories_burned,

    ROUND(AVG(step_total),2) AS avg_steps

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_calories` c

JOIN `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_steps` s

ON c.Id = s.Id
AND c.activity_hour = s.activity_hour

GROUP BY day_type;


-- Analyze behavioral consistency across the day
SELECT
    activity_hour,
    ROUND(AVG(total_intensity),2) AS avg_daily_intensity_pattern
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_hourly_intensities`
GROUP BY activity_hour
ORDER BY activity_hour;