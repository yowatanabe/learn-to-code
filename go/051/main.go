package main

import "fmt"

func main() {
	fruits := []string{}

	fruits = append(fruits, "apple")
	fruits = append(fruits, "orange")

	fmt.Println(fruits)
}
