package main

import "fmt"

func convertToUppercaseLongStrings(strings []string) []string {
	var result []string

	for _, str := range strings {
		if len(str) >= 5 {
			upper := ""
			for _, char := range str {
				if char >= 'a' && char <= 'z' {
					upper += string(char - 32)
				} else {
					upper += string(char)
				}
			}
			result = append(result, upper)
		}
	}
	return result
}

func main() {
	strings := []string{"apple", "banana", "orange"}
	result := convertToUppercaseLongStrings(strings)
	fmt.Println("結果:", result)
}
