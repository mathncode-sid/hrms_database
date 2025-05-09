-- Human Resource Management System (HRMS) Database
CREATE DATABASE hrmsDB;

USE hrmsDB;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS Project_Assignments, Projects, Leave_Requests, Attendance, Salaries, Employees, Job_Roles, Departments;


-- 1. Departments

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

INSERT INTO Departments (name, location) VALUES
('Human Resources', 'Nairobi'),
('Engineering', 'Mombasa'),
('Finance', 'Nairobi'),
('Marketing', 'Kisumu');

-- 2. Job Roles
CREATE TABLE Job_Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    level VARCHAR(50) NOT NULL
);

INSERT INTO Job_Roles (title, level) VALUES
('HR Manager', 'Senior'),
('Software Engineer', 'Mid'),
('Data Analyst', 'Junior'),
('Accountant', 'Mid'),
('Marketing Officer', 'Junior');

-- 3. Employees
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    department_id INT,
    role_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (role_id) REFERENCES Job_Roles(role_id)
);

INSERT INTO Employees (first_name, last_name, email, phone, hire_date, department_id, role_id) VALUES
('Alice', 'Kimani', 'alice.kimani@company.com', '0712345678', '2022-01-15', 1, 1),
('Brian', 'Otieno', 'brian.otieno@company.com', '0723456789', '2021-07-23', 2, 2),
('Catherine', 'Mwangi', 'catherine.mwangi@company.com', '0734567890', '2023-02-10', 3, 4),
('David', 'Ouma', 'david.ouma@company.com', '0745678901', '2020-11-03', 2, 3),
('Emily', 'Wanjiku', 'emily.wanjiku@company.com', '0756789012', '2022-08-01', 4, 5);

-- 4. Salaries
CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    base_salary DECIMAL(10,2) NOT NULL,
    bonus DECIMAL(10,2),
    effective_from DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Salaries (employee_id, base_salary, bonus, effective_from) VALUES
(1, 120000.00, 15000.00, '2023-01-01'),
(2, 95000.00, 5000.00, '2022-01-01'),
(3, 75000.00, 3000.00, '2023-03-01'),
(4, 68000.00, 2000.00, '2021-11-01'),
(5, 72000.00, 3500.00, '2022-08-01');

-- 5. Attendance
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Leave') NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Attendance (employee_id, date, status) VALUES
(1, '2024-05-01', 'Present'),
(2, '2024-05-01', 'Leave'),
(3, '2024-05-01', 'Present'),
(4, '2024-05-01', 'Absent'),
(5, '2024-05-01', 'Present');

-- 6. Leave Requests

CREATE TABLE Leave_Requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason TEXT,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Leave_Requests (employee_id, start_date, end_date, reason, status) VALUES
(2, '2024-05-01', '2024-05-03', 'Medical leave', 'Approved'),
(4, '2024-06-10', '2024-06-12', 'Family emergency', 'Pending');

-- 7. Projects
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Projects (name, start_date, end_date, department_id) VALUES
('Employee Portal Revamp', '2024-04-01', NULL, 2),
('Financial Audit 2024', '2024-03-01', '2024-06-30', 3),
('Recruitment Drive', '2024-02-01', '2024-05-15', 1);

-- 8. Project Assignments
CREATE TABLE Project_Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    employee_id INT,
    assigned_on DATE,
    role_in_project VARCHAR(100),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Project_Assignments (project_id, employee_id, assigned_on, role_in_project) VALUES
(1, 2, '2024-04-02', 'Frontend Developer'),
(1, 4, '2024-04-03', 'Data Integration'),
(2, 3, '2024-03-02', 'Financial Analyst'),
(3, 1, '2024-02-02', 'Lead Recruiter');
