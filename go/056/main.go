package main

import (
	"fmt"
	"sync"
	"time"
)

type Task struct {
	ID   int
	Work func()
}

func worker(id int, tasks <-chan Task, wg *sync.WaitGroup) {
	for task := range tasks {
		startTime := time.Now()
		task.Work()
		fmt.Printf("Task %d finished in %v\n", task.ID, time.Since(startTime))
		wg.Done()
	}
}

func main() {
	numWorkers := 3
	numTasks := 5

	var wg sync.WaitGroup
	wg.Add(numTasks)

	taskChannel := make(chan Task, numTasks)

	for i := 0; i < numWorkers; i++ {
		go worker(i, taskChannel, &wg)
	}

	for i := 0; i < numTasks; i++ {
		id := i
		taskChannel <- Task{
			ID: id,
			Work: func() {
				// 以下は仮のタスク
				time.Sleep(1 * time.Second)
			},
		}
	}

	close(taskChannel)
	wg.Wait()
}
