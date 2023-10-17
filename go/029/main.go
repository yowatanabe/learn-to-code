package main

import "fmt"

func fibonacci(n int) []int {
	fib := make([]int, n)
	fib[0], fib[1] = 0, 1
	for i := 2; i < n; i++ {
		fib[i] = fib[i-1] + fib[i-2]
	}
	return fib
}

func main() {
	fibSequence := fibonacci(10)
	fmt.Println(fibSequence)
}
