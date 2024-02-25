<?php

class TaskManager
{
    private $tasks = [];

    // タスクの追加
    public function addTask($title, $description)
    {
        $task = [
            'title' => $title,
            'description' => $description,
        ];
        $this->tasks[] = $task;
        echo "タスクが追加されました: $title\n";
    }

    // タスクの表示
    public function displayTasks()
    {
        if (empty($this->tasks)) {
            echo "タスクはありません。\n";
        } else {
            echo "タスク一覧:\n";
            foreach ($this->tasks as $index => $task) {
                echo "$index. {$task['title']} - {$task['description']}\n";
            }
        }
    }

    // タスクの削除
    public function deleteTask($index)
    {
        if (isset($this->tasks[$index])) {
            $deletedTask = $this->tasks[$index];
            unset($this->tasks[$index]);
            echo "タスクが削除されました: {$deletedTask['title']}\n";
        } else {
            echo "指定されたインデックスのタスクは存在しません。\n";
        }
    }
}

$taskManager = new TaskManager();

$taskManager->addTask("タスク1", "これはタスク1の説明です。");
$taskManager->addTask("タスク2", "これはタスク2の説明です。");

$taskManager->displayTasks();
$taskManager->deleteTask(0);
$taskManager->displayTasks();
