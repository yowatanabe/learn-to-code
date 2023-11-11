package main

import (
	"fmt"
	"sync"
	"time"
)

type Job struct {
	ID   int
	Task string
}

var (
	jobQueue   []Job
	jobCounter int
	mutex      sync.Mutex
)

func addJob(task string) {
	mutex.Lock()
	defer mutex.Unlock()

	job := Job{
		ID:   jobCounter,
		Task: task,
	}

	jobQueue = append(jobQueue, job)
	jobCounter++
	fmt.Printf("ジョブが追加されました - ID: %d, Task: %s\n", job.ID, job.Task)
}

func processJob() {
	mutex.Lock()
	defer mutex.Unlock()

	if len(jobQueue) > 0 {
		job := jobQueue[0]
		jobQueue = jobQueue[1:]

		fmt.Printf("実行中のジョブ - ID: %d, Task: %s\n", job.ID, job.Task)
	}

}

func main() {
	jobQueue = make([]Job, 0)
	jobCounter = 1

	go func() {
		for {
			fmt.Print("タスクを入力する（終了するには「exit」と入力する）: ")
			var task string
			fmt.Scanln(&task)

			if task == "exit" {
				break
			}

			addJob(task)
		}
	}()

	for {
		processJob()
		time.Sleep(1 * time.Second)
	}
}
