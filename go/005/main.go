package main

import "fmt"

func main() {
	x := 10
	y := 20
	fmt.Printf("交換前: x=%d, y=%d\n", x, y)

	temp := x
	x = y
	y = temp
	fmt.Printf("交換後: x=%d, y=%d\n", x, y)
}
