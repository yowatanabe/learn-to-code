package main

import "fmt"

func addProduct(inventory map[string]int, code string, quantity int) {
	inventory[code] += quantity
}

func showInventory(inventory map[string]int) {
	for code, quantity := range inventory {
		fmt.Printf("商品名: %s, 数量: %v個\n", code, quantity)
	}
}

func main() {
	inventory := make(map[string]int)

	addProduct(inventory, "商品001", 100)
	addProduct(inventory, "商品002", 50)

	showInventory(inventory)
}
