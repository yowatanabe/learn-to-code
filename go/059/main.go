package main

import (
	"fmt"
	"sync"
)

type Product struct {
	Name  string
	Price float64
}

func filterProductsByPrice(products []Product, minPrice, maxPrice float64) []Product {
	result := make([]Product, 0)
	ch := make(chan Product)
	var wg sync.WaitGroup
	var mu sync.Mutex

	for _, p := range products {
		wg.Add(1)
		go func(prod Product) {
			defer wg.Done()
			if prod.Price >= minPrice && prod.Price <= maxPrice {
				ch <- prod
			}
		}(p)
	}

	go func() {
		wg.Wait()
		close(ch)
	}()

	for prod := range ch {
		mu.Lock()
		result = append(result, prod)
		mu.Unlock()
	}

	return result
}

func main() {
	products := []Product{
		{Name: "商品A", Price: 10},
		{Name: "商品B", Price: 20},
		{Name: "商品C", Price: 30},
		{Name: "商品D", Price: 40},
		{Name: "商品E", Price: 50},
		{Name: "商品F", Price: 60},
		{Name: "商品G", Price: 70},
		{Name: "商品H", Price: 80},
		{Name: "商品I", Price: 90},
		{Name: "商品J", Price: 100},
	}

	filteredProducts := filterProductsByPrice(products, 30, 60)
	fmt.Println("特定の価格範囲に該当する商品:")
	for _, p := range filteredProducts {
		fmt.Printf("商品名: %s, 価格: %.2f\n", p.Name, p.Price)
	}
}
