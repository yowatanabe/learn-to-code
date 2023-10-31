package main

import (
	"fmt"
	"strings"
	"sync"
)

func toUpper(words []string) []string {
	results := make([]string, len(words))
	var wg sync.WaitGroup

	wg.Add(len(words))

	for i, word := range words {
		go func(i int, w string) {
			defer wg.Done()
			results[i] = strings.ToUpper(w)
		}(i, word)
	}

	wg.Wait()
	return results
}

func main() {
	words := []string{"hogehoge", "fugafuga"}

	upperWords := toUpper(words)

	fmt.Println(upperWords)
}
