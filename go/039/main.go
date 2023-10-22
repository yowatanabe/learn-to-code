package main

import "fmt"

type Book struct {
	Title  string
	Author string
	Pages  int
}

func countPages(books []Book) int {
	if len(books) == 0 {
		return 0
	}
	return books[0].Pages + countPages(books[1:])
}

func main() {
	books := []Book{
		{Title: "書籍1", Author: "著者A", Pages: 100},
		{Title: "書籍2", Author: "著者B", Pages: 200},
		{Title: "書籍3", Author: "著者C", Pages: 300},
	}

	ratings := make(map[string]int)
	ratings["書籍1"] = 5
	ratings["書籍2"] = 3
	ratings["書籍3"] = 1

	for _, book := range books {
		fmt.Printf("%s by %s\n", book.Title, book.Author)
		switch {
		case ratings[book.Title] == 5:
			fmt.Println("評価: ⭐⭐⭐⭐⭐")
		case ratings[book.Title] == 4:
			fmt.Println("評価: ⭐⭐⭐⭐")
		case ratings[book.Title] == 3:
			fmt.Println("評価: ⭐⭐⭐")
		case ratings[book.Title] == 2:
			fmt.Println("評価: ⭐⭐")
		default:
			fmt.Println("評価: ⭐")
		}
	}
	fmt.Printf("全書籍の総ページ数: %d\n", countPages(books))
}
