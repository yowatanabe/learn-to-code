package main

import "fmt"

type Product struct {
	Name  string
	Price int
}

func countStock(stock map[string]int) int {
	totalStock := 0
	for _, value := range stock {
		totalStock += value
	}
	return totalStock
}

func main() {
	products := []Product{
		{Name: "Product1", Price: 100},
		{Name: "Product2", Price: 200},
		{Name: "Product3", Price: 300},
	}

	productStock := make(map[string]int)
	productStock["Product1"] = 1
	productStock["Product2"] = 5
	productStock["Product3"] = 10

	for _, product := range products {
		fmt.Printf("%s: $%d\n", product.Name, product.Price)
		switch {
		case productStock[product.Name] > 5:
			fmt.Println("在庫あり")
		default:
			fmt.Println("在庫わずか")
		}
	}

	fmt.Printf("総在庫数: %d\n", countStock(productStock))
}
