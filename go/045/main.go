package main

import (
	"fmt"
	"strconv"
)

func countOnes(n int) int {
	count := 0
	binaryStr := strconv.FormatInt(int64(n), 2)

	for _, c := range binaryStr {
		if c == '1' {
			count++
		}
	}
	return count
}

func main() {
	n := 100

	count := countOnes(n)

	fmt.Printf("10進数%dの2進数は%bです。\n", n, n)
	fmt.Printf("2進数で表したときに1は%d個あります。\n", count)
}
