package main

import (
	"fmt"
	"sync"
)

func isPrime(num int) bool {
	if num <= 1 {
		return false
	}
	for i := 2; i*i <= num; i++ {
		if num%i == 0 {
			return false
		}
	}
	return true
}

func countPrimes(nums []int) int {
	var wg sync.WaitGroup
	wg.Add(len(nums))

	count := 0
	results := make(chan bool, len(nums))

	for _, num := range nums {
		go func(n int) {
			defer wg.Done()
			results <- isPrime(n)
		}(num)
	}

	go func() {
		wg.Wait()
		close(results)
	}()

	for r := range results {
		if r {
			count++
		}
	}

	return count
}

func main() {
	numbers := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	primeCount := countPrimes(numbers)
	fmt.Println("素数の数:", primeCount)
}
