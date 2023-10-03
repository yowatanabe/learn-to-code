package main

import (
	"fmt"
)

func main() {
	fmt.Println("1から100までの整数を入力してください:")

	var num int
	fmt.Scanln(&num)

	switch {
	case num%3 == 0 && num%5 == 0:
		fmt.Println("FizzBuzz")
	case num%3 == 0:
		fmt.Println("Fizz")
	case num%5 == 0:
		fmt.Println("Buzz")
	default:
		fmt.Println(num)
	}
}
