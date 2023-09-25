package main

import "fmt"

func main() {
	fruits := []string{"りんご", "バナナ", "オレンジ", "イチゴ", "パイナップル"}
	fmt.Println("3番目の果物:", getFruit(fruits, 2))
}

func getFruit(fruits []string, index int) string {
	if index >= 0 && index < len(fruits) {
		return fruits[index]
	}
	return "見つかりません"
}
