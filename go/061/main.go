package main

import (
	"fmt"
	"sync"
)

func square(nums []int) {
	var wg sync.WaitGroup

	for _, num := range nums {
		wg.Add(1)

		go func(n int) {
			defer wg.Done()
			fmt.Println(n * n)
		}(num)
	}

	wg.Wait()
}

func main() {
	data := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	square(data)
}
