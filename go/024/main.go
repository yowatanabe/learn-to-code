package main

import "fmt"

type Product struct {
	Name  string
	Price int
	Stock int
}

func printProduct(product Product) {
	fmt.Printf("商品名: %s\n", product.Name)
	fmt.Printf("価格: %d 円\n", product.Price)
	fmt.Printf("在庫数: %d\n", product.Stock)
}

func main() {
	inventory := make(map[string]Product)

	inventory["item1"] = Product{"商品1", 1000, 10}
	inventory["item2"] = Product{"商品2", 1500, 5}
	inventory["item3"] = Product{"商品3", 800, 8}

	var itemName string
	for {
		fmt.Print("商品名を入力（'exit' で終了）: ")
		fmt.Scanln(&itemName)

		if itemName == "exit" {
			break
		}

		product, exists := inventory[itemName]
		if !exists {
			fmt.Println("商品が見つかりません")
			continue
		}

		printProduct(product)

		var quantity int
		fmt.Print("購入数量を入力: ")
		fmt.Scanln(&quantity)

		if quantity <= 0 {
			fmt.Println("無効な数量です")
			continue
		}

		if quantity > product.Stock {
			fmt.Println("在庫切れ")
		} else {
			product.Stock -= quantity
			inventory[itemName] = product
			fmt.Printf("%d 個購入しました\n", quantity)
		}
	}
}
