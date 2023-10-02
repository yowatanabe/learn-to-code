package main

import (
	"fmt"
)

func main() {
	fmt.Println("1から10までの整数を入力してください:")

	var num int
	fmt.Scanln(&num)

	switch num {
	case 1:
		fmt.Println("one")
	case 2:
		fmt.Println("two")
	case 3:
		fmt.Println("three")
	case 4:
		fmt.Println("four")
	case 5:
		fmt.Println("five")
	case 6:
		fmt.Println("six")
	case 7:
		fmt.Println("seven")
	case 8:
		fmt.Println("eight")
	case 9:
		fmt.Println("nine")
	case 10:
		fmt.Println("ten")
	default:
		fmt.Println("その整数は対応していません")
	}
}
