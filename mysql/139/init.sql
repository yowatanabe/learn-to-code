-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  project_status (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    total_tasks INT DEFAULT 0, -- プロジェクトに関連するタスクの総数
    completed_tasks INT DEFAULT 0, -- 完了したタスクの数
    progress_rate DECIMAL(5, 2) DEFAULT 0 -- 進捗率(%)
  );

CREATE TABLE
  tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    task_name VARCHAR(100),
    status ENUM ('Pending', 'In Progress', 'Completed'), -- タスクのステータス
    FOREIGN KEY (project_id) REFERENCES project_status (project_id)
  );

-- 初期データ挿入
INSERT INTO
  project_status (
    project_id,
    project_name,
    total_tasks,
    completed_tasks,
    progress_rate
  )
VALUES
  (1, 'Project A', 3, 1, 33.33),
  (2, 'Project B', 2, 0, 0.00);

INSERT INTO
  tasks (project_id, task_name, status)
VALUES
  (1, 'Task 1', 'Completed'),
  (1, 'Task 2', 'In Progress'),
  (1, 'Task 3', 'Pending'),
  (2, 'Task 1', 'Pending'),
  (2, 'Task 2', 'Pending');
