package main

import "fmt"

type Item struct {
	Name  string
	Stock int
	Price float64
}

var itemDB = make(map[string]Item)

func AddItem(name string, stock int, price float64) {
	item := Item{
		Name:  name,
		Stock: stock,
		Price: price,
	}
	itemDB[name] = item
}

func updateStock(name string, newStock int) {
	if item, ok := itemDB[name]; ok {
		item.Stock = newStock
		itemDB[name] = item
	}
}

func UpdatePrice(name string, newPrice float64) {
	if item, ok := itemDB[name]; ok {
		item.Price = newPrice
		itemDB[name] = item
	}
}

func DeleteItem(name string) {
	delete(itemDB, name)
}

func GetItemInfo(name string) Item {
	return itemDB[name]
}

func GetAllItems() []Item {
	var items []Item
	for _, item := range itemDB {
		items = append(items, item)
	}
	return items
}

func main() {
	AddItem("item1", 10, 14.99)
	AddItem("item2", 23, 6.99)
	AddItem("item3", 4, 23.99)

	fmt.Println("Item1 Info:")
	item1 := GetItemInfo("item1")
	fmt.Printf("Name: %s, Stock: %d, Price: $%.2f\n", item1.Name, item1.Stock, item1.Price)

	updateStock("item2", 39)
	UpdatePrice("item1", 17.99)

	DeleteItem("item3")

	allItems := GetAllItems()
	fmt.Println("\nAll Items:")
	for _, item := range allItems {
		fmt.Printf("Name: %s, Stock: %d, Price: $%.2f\n", item.Name, item.Stock, item.Price)
	}
}
