package main

import (
	"fmt"
)

func sumParallel(n int, ch chan int) {
	sum := 0

	for i := 1; i <= n; i++ {
		sum += i
	}
	ch <- sum
}

func main() {
	n := 10

	ch := make(chan int)

	go sumParallel(n, ch)

	result := <-ch

	fmt.Println(result)
}
