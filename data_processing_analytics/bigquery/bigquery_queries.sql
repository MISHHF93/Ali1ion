-- Create a new dataset
CREATE SCHEMA IF NOT EXISTS nao_ai_dataset;

-- Create a new table
CREATE TABLE IF NOT EXISTS nao_ai_dataset.user_activity (
    user_id STRING,
    activity STRING,
    activity_time TIMESTAMP
);

-- Insert sample data into the table
INSERT INTO nao_ai_dataset.user_activity (user_id, activity, activity_time)
VALUES
    ('user_1', 'login', '2024-01-01 10:00:00 UTC'),
    ('user_2', 'purchase', '2024-01-02 11:00:00 UTC'),
    ('user_1', 'logout', '2024-01-01 12:00:00 UTC'),
    ('user_3', 'login', '2024-01-03 14:00:00 UTC'),
    ('user_2', 'login', '2024-01-02 09:00:00 UTC');

-- Query to select all data from the table
SELECT * FROM nao_ai_dataset.user_activity;

-- Query to count the number of activities per user
SELECT 
    user_id, 
    COUNT(activity) AS activity_count
FROM 
    nao_ai_dataset.user_activity
GROUP BY 
    user_id;

-- Query to find the most recent activity for each user
SELECT 
    user_id, 
    activity, 
    MAX(activity_time) AS last_activity_time
FROM 
    nao_ai_dataset.user_activity
GROUP BY 
    user_id, activity;
