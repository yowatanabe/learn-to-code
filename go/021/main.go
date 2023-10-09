package main

import "fmt"

type Task struct {
	Title string
	Done  bool
}

var tasks []Task

func AddTask(title string) {
	task := Task{Title: title, Done: false}
	tasks = append(tasks, task)
}

func ToggleTask(title string) {
	for i := range tasks {
		if tasks[i].Title == title {
			tasks[i].Done = !tasks[i].Done
			break
		}
	}
}

func DeleteTask(title string) {
	for i, task := range tasks {
		if task.Title == title {
			tasks = append(tasks[:i], tasks[i+1:]...)
			break
		}
	}
}

func ListTasks() {
	fmt.Println("Tasks:")
	for i, task := range tasks {
		status := "Not Done"
		if task.Done {
			status = "Done"
		}
		fmt.Printf("%d. %s (%s)\n", i+1, task.Title, status)
	}
}

func main() {
	AddTask("Buy groceries")
	AddTask("Read a book")
	AddTask("Go for a run")

	ListTasks()

	ToggleTask("Buy groceries")

	DeleteTask("Read a book")

	ListTasks()
}
