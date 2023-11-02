package main

import (
	"fmt"
	"os"
	"sync"
)

func printFile(filename string) {
	var wg sync.WaitGroup

	wg.Add(2)

	go func() {
		defer wg.Done()

		data, err := os.ReadFile(filename)
		if err != nil {
			fmt.Println(err)
			return
		}

		fmt.Print(string(data))
	}()

	go func() {
		defer wg.Done()

		fmt.Println("読み込んだファイルの内容:")
	}()

	wg.Wait()
}

func main() {
	file := "data.txt"
	printFile(file)
}
