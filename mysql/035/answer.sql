-- 第1正規形 (1NF)
-- 1NFの要件を満たすために、各フィールドが単一値を保持するようにし、重複するグループを取り除きます。
CREATE TABLE
  EmployeeProjects_1NF (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    ProjectName VARCHAR(100),
    ManagerName VARCHAR(100)
  );

INSERT INTO
  EmployeeProjects_1NF (
    EmployeeID,
    EmployeeName,
    ProjectName,
    ManagerName
  )
VALUES
  (1, 'Alice', 'Website Redesign', 'John Doe'),
  (1, 'Alice', 'App Development', 'Jane Smith'),
  (2, 'Bob', 'Data Analysis', 'Peter Johnson'),
  (3, 'Charlie', 'Website Redesign', 'John Doe'),
  (3, 'Charlie', 'Data Migration', 'Mary Brown'),
  (3, 'Charlie', 'Cloud Setup', 'Steve White');

-- 第2正規形 (2NF)
-- 2NFの要件を満たすために、部分関数従属性を排除します。ここでは、社員情報とプロジェクト情報を別のテーブルに分割します。
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100)
  );

CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    ManagerName VARCHAR(100)
  );

CREATE TABLE
  EmployeeProjects_2NF (
    EmployeeID INT,
    ProjectID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID)
  );

INSERT INTO
  Employees (EmployeeID, EmployeeName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Projects (ProjectName, ManagerName)
VALUES
  ('Website Redesign', 'John Doe'),
  ('App Development', 'Jane Smith'),
  ('Data Analysis', 'Peter Johnson'),
  ('Data Migration', 'Mary Brown'),
  ('Cloud Setup', 'Steve White');

INSERT INTO
  EmployeeProjects_2NF (EmployeeID, ProjectID)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (3, 5);

-- 第3正規形 (3NF)
-- 3NFの要件を満たすために、推移的関数従属性を排除します。ここでは、マネージャ情報を別のテーブルに分割します。
CREATE TABLE
  Managers (
    ManagerID INT PRIMARY KEY AUTO_INCREMENT,
    ManagerName VARCHAR(100)
  );

CREATE TABLE
  Projects_3NF (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Managers (ManagerID)
  );

INSERT INTO
  Managers (ManagerName)
VALUES
  ('John Doe'),
  ('Jane Smith'),
  ('Peter Johnson'),
  ('Mary Brown'),
  ('Steve White');

INSERT INTO
  Projects_3NF (ProjectID, ProjectName, ManagerID)
VALUES
  (1, 'Website Redesign', 1),
  (2, 'App Development', 2),
  (3, 'Data Analysis', 3),
  (4, 'Data Migration', 4),
  (5, 'Cloud Setup', 5);

CREATE TABLE
  EmployeeProjects_3NF (
    EmployeeID INT,
    ProjectID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects_3NF (ProjectID)
  );

INSERT INTO
  EmployeeProjects_3NF (EmployeeID, ProjectID)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (3, 5);
