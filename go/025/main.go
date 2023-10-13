package main

import "fmt"

type Task struct {
	Title     string
	Priority  int
	Completed bool
}

const (
	Low    = 1
	Medium = 2
	High   = 3
)

func printTask(task Task) {
	completed := "未完了"
	if task.Completed {
		completed = "完了"
	}
	fmt.Printf("[%s] 優先度: %d - %s\n", completed, task.Priority, task.Title)
}

func addTask(tasks []Task, title string, priority int) []Task {
	task := Task{title, priority, false}
	return append(tasks, task)
}

func main() {
	tasks := []Task{}

	for {
		fmt.Println("操作を選んでください:")
		fmt.Println("1. タスクを追加")
		fmt.Println("2. タスクを表示")
		fmt.Println("3. タスクを完了")
		fmt.Println("4. タスクを削除")
		fmt.Println("5. 終了")

		var choice int
		fmt.Scanln(&choice)

		switch choice {
		case 1:
			var title string
			var priority int

			fmt.Print("タスクのタイトルを入力: ")
			fmt.Scanln(&title)
			fmt.Print("優先度 (1-3) を入力: ")
			fmt.Scanln(&priority)

			if priority < 1 || priority > 3 {
				fmt.Println("無効な優先度です")
				continue
			}

			tasks = addTask(tasks, title, priority)
			fmt.Println("タスクを追加しました")

		case 2:
			fmt.Println("タスク一覧:")
			for i, task := range tasks {
				fmt.Printf("%d. ", i+1)
				printTask(task)
			}

		case 3:
			fmt.Print("完了したいタスクの番号を入力: ")
			var index int
			fmt.Scanln(&index)
			if index < 1 || index > len(tasks) {
				fmt.Println("無効な番号です")
				continue
			}
			tasks[index-1].Completed = true
			fmt.Println("タスクを完了しました")

		case 4:
			fmt.Print("削除したいタスクの番号を入力: ")
			var index int
			fmt.Scanln(&index)
			if index < 1 || index > len(tasks) {
				fmt.Println("無効な番号です")
				continue
			}
			tasks = append(tasks[:index-1], tasks[index:]...)
			fmt.Println("タスクを削除しました")

		case 5:
			fmt.Println("プログラムを終了します")
			return

		default:
			fmt.Println("無効な操作です")
		}
	}
}
