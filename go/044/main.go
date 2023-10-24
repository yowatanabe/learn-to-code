package main

import "fmt"

type MenuItem struct {
	Name  string
	Price int
}

func showMenu(menu []MenuItem) {
	for _, item := range menu {
		fmt.Printf("%s %v円\n", item.Name, item.Price)
	}
}

func main() {
	menu := []MenuItem{
		{"チャーハン", 600},
		{"ラーメン", 800},
		{"餃子", 400},
	}
	showMenu(menu)
}
