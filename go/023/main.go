package main

import "fmt"

type Product struct {
	Name  string
	Price int
	Stock int
}

var inventory = map[string]Product{
	"item1": {"Item 1", 10, 1},
	"item2": {"Item 2", 20, 2},
	"item3": {"Item 3", 30, 3},
}

func ListInventory() {
	fmt.Println("Inventory:")
	for _, product := range inventory {
		fmt.Printf("Name: %s, Price: $%d, Stock: %d\n", product.Name, product.Price, product.Stock)
	}
}

func ProcessOrder(itemName string, quantity int) {
	product, found := inventory[itemName]
	if !found {
		fmt.Printf("Error: Item '%s' not found in inventory.\n", itemName)
		return
	}

	if quantity > product.Stock {
		fmt.Printf("Error: Not enough '%s' in stock.\n", itemName)
	} else {
		product.Stock -= quantity
		inventory[itemName] = product
		fmt.Printf("%d units of '%s' successfully ordered for $%d.\n", quantity, itemName, quantity*product.Price)
	}
}

func GetPrice(itemName string) int {
	product, found := inventory[itemName]
	if !found {
		return -1
	}
	return product.Price
}

func CalculateTotalPrice() int {
	total := 0
	for _, product := range inventory {
		total += product.Price
	}
	return total
}

func DeleteProduct(itemName string) {
	_, found := inventory[itemName]
	if found {
		delete(inventory, itemName)
	}
}

func main() {
	ListInventory()

	ProcessOrder("item1", 1)
	ProcessOrder("item2", 2)
	ProcessOrder("item3", 30)

	price := GetPrice("item3")
	if price != -1 {
		fmt.Printf("Price of 'item3' is $%d\n", price)
	} else {
		fmt.Println("'item3' not found.")
	}

	totalPrice := CalculateTotalPrice()
	fmt.Printf("Total price of all items in inventory: $%d\n", totalPrice)

	DeleteProduct("item2")
	fmt.Println("After deleting 'item2':")
	ListInventory()
}
