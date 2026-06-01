-- Bellabeat Health & Behavioural Analytics Project
-- Author: Ved Shah
-- File: 04-user-segmentation.sql
-- Description: User activity segmentation analysis based on daily step behavior and activity intensity.


-- Create user activity segmentation table
CREATE OR REPLACE TABLE `project-86db8aeb-661f-4822-833.bellabeat_clean.user_activity_segments` AS

SELECT
    Id,

    ROUND(AVG(total_steps),2) AS avg_daily_steps,

    ROUND(AVG(calories),2) AS avg_calories_burned,

    ROUND(AVG(sedentary_minutes),2) AS avg_sedentary_minutes,

    ROUND(AVG(very_active_minutes),2) AS avg_very_active_minutes,

    CASE
        WHEN AVG(total_steps) < 5000 THEN 'Sedentary Users'
        WHEN AVG(total_steps) BETWEEN 5000 AND 7499 THEN 'Lightly Active Users'
        WHEN AVG(total_steps) BETWEEN 7500 AND 9999 THEN 'Moderately Active Users'
        ELSE 'Highly Active Users'
    END AS activity_segment

FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.clean_daily_activity`

GROUP BY Id;


-- Count users in each activity segment
SELECT
    activity_segment,
    COUNT(*) AS total_users
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.user_activity_segments`
GROUP BY activity_segment
ORDER BY total_users DESC;


-- Analyze average calories burned by segment
SELECT
    activity_segment,
    ROUND(AVG(avg_calories_burned),2) AS avg_calories
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.user_activity_segments`
GROUP BY activity_segment
ORDER BY avg_calories DESC;


-- Analyze average sedentary minutes by segment
SELECT
    activity_segment,
    ROUND(AVG(avg_sedentary_minutes),2) AS avg_sedentary_time
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.user_activity_segments`
GROUP BY activity_segment
ORDER BY avg_sedentary_time DESC;


-- Analyze average very active minutes by segment
SELECT
    activity_segment,
    ROUND(AVG(avg_very_active_minutes),2) AS avg_active_minutes
FROM `project-86db8aeb-661f-4822-833.bellabeat_clean.user_activity_segments`
GROUP BY activity_segment
ORDER BY avg_active_minutes DESC;