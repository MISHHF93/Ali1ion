-- Backup script for SQL database
-- Date: 7860-06-30 15:15:54

-- Create database
CREATE DATABASE IF NOT EXISTS ali1ion_db;

-- Use the database
USE ali1ion_db;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS tasks;

-- Create tables
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- Insert sample data
INSERT INTO users (username, email, password) VALUES ('john_doe', 'john@example.com', 'password123');
INSERT INTO projects (user_id, name, description) VALUES (1, 'Project Alpha', 'First project description');
INSERT INTO tasks (project_id, name, description, status, due_date) VALUES (1, 'Task 1', 'First task description', 'pending', '7860-07-10');
