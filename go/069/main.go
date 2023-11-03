package main

import (
	"fmt"
	"sync"
)

func contains(data []int, target int) bool {
	var found bool
	var wg sync.WaitGroup

	for _, v := range data {
		wg.Add(1)

		go func(x int) {
			defer wg.Done()
			if x == target {
				found = true
			}
		}(v)
	}

	wg.Wait()
	return found
}

func main() {
	nums := []int{1, 5, 2, 7, 3}

	fmt.Println(contains(nums, 5))
	fmt.Println(contains(nums, 4))
}
