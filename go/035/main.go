package main

import "fmt"

func main() {
	odd := make([]int, 0)
	even := make([]int, 0)

	for i := 1; i <= 100; i++ {
		if i%2 == 1 {
			odd = append(odd, i)
		} else {
			even = append(even, i)
		}
	}

	fmt.Println("奇数:", odd)
	fmt.Println("偶数:", even)
}
