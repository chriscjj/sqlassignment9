
CREATE TABLE Worker (
    Worker_Id INT NOT NULL PRIMARY KEY,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) NOT NULL,
    Salary INT NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department CHAR(25) NOT NULL
);

-- Q1
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;


CALL AddWorker(1, 'John', 'Doe', 50000, '2024-11-25 10:00:00', 'HR');
SELECT * FROM Worker;
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 

(2, 'Jane', 'Smith', 60000, '2023-10-15 09:30:00', 'Finance'),
(3, 'Alice', 'Brown', 55000, '2022-08-20 14:00:00', 'IT'),
(4, 'Bob', 'Johnson', 45000, '2021-12-01 08:15:00', 'HR');

-- Q2
DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;


SET @worker_id = 1;
SET @salary = 0;
CALL GetWorkerSalary(@worker_id, @salary);
SELECT @salary AS WorkerSalary;

-- Q3
DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

	
CALL UpdateWorkerDepartment(1, 'Finance');

-- Q4
DELIMITER $$

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;


SET @department = 'Finance';
SET @worker_count = 0;
CALL GetWorkerCount(@department, @worker_count);
SELECT @worker_count AS WorkerCount;

-- Q5

DELIMITER $$

CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25),
    OUT p_AvgSalary FLOAT
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

SET @department = 'Finance';
SET @avg_salary = 0;
CALL GetAverageSalary(@department, @avg_salary);
SELECT @avg_salary AS AverageSalary;




