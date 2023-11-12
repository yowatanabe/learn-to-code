package main

import "fmt"

func removeDuplicates(s string) string {
	stack := make([]byte, 0)

	for i := range s {
		if len(stack) == 0 || stack[len(stack)-1] != s[i] {
			stack = append(stack, s[i])
		}
	}

	return string(stack)
}

func main() {
	input := "hello"
	result := removeDuplicates(input)
	fmt.Println(result)
}
