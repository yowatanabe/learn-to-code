package main

import "fmt"

func primeFactors(n int) []int {
	factors := []int{}

	for i := 2; i <= n; i++ {
		for n%i == 0 {
			factors = append(factors, i)

			n /= i
		}
	}
	return factors
}

func main() {
	n := 100

	factors := primeFactors(n)
	fmt.Println(factors)
}
