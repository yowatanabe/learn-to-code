package main

import (
	"fmt"
	"sync"
)

func countCharacters(s string) map[string]int {
	counts := make(map[string]int)

	wg := sync.WaitGroup{}
	mu := sync.Mutex{}

	for _, c := range s {
		wg.Add(1)
		go func(c byte) {
			mu.Lock()
			counts[string(c)]++
			mu.Unlock()

			wg.Done()
		}(byte(c))
	}

	wg.Wait()

	return counts
}

func main() {
	s := "hogehoge"

	counts := countCharacters(s)

	for c, count := range counts {
		fmt.Println(c, count)
	}
}
