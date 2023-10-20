package main

import "fmt"

type Product struct {
	Name  string
	Price int
}

const taxRate = 0.1

func applyTax(products []Product, rate float64) {
	for i := range products {
		products[i].Price = int(float64(products[i].Price) * (1 + rate))
	}
}

func printProductPrice(products []Product) {
	for _, p := range products {
		fmt.Printf("%s: %d\n", p.Name, p.Price)
	}
}

func main() {
	products := []Product{
		{Name: "item1", Price: 100},
		{Name: "item2", Price: 200},
		{Name: "item3", Price: 300},
	}

	fmt.Println("Item prices:")
	printProductPrice(products)

	applyTax(products, taxRate)

	fmt.Println("\nPrices after applying tax:")
	printProductPrice(products)
}
