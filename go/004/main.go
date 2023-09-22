package main

import "fmt"

func main() {
	productName := "スマートフォン"
	productID := 1001
	price := 499.99
	isAvailable := true

	fmt.Printf("商品名: %s\n", productName)
	fmt.Printf("商品ID: %d\n", productID)
	fmt.Printf("価格: $%.2f\n", price)
	fmt.Printf("在庫あり: %v\n", isAvailable)
}
