package main

import "fmt"

func main() {
	multiple_of_3 := make([]int, 0)
	multiple_of_5 := make([]int, 0)
	multiple_of_15 := make([]int, 0)

	for i := 1; i <= 100; i++ {
		if i%3 == 0 {
			multiple_of_3 = append(multiple_of_3, i)
		}
		if i%5 == 0 {
			multiple_of_5 = append(multiple_of_5, i)
		}
		if i%15 == 0 {
			multiple_of_15 = append(multiple_of_15, i)
		}
	}

	fmt.Println("3の倍数:", multiple_of_3)
	fmt.Println("5の倍数:", multiple_of_5)
	fmt.Println("15の倍数:", multiple_of_15)
}
