package main

import "fmt"

type User struct {
	ID   int
	Name string
}

type Post struct {
	Title  string
	Author string
	Views  int
}

func showFields(items interface{}) {
	switch v := items.(type) {
	case []User:
		for _, u := range v {
			fmt.Println(u.ID, u.Name)
		}
	case []Post:
		for _, p := range v {
			fmt.Println(p.Title, p.Author, p.Views)
		}
	}
}

func main() {
	users := []User{
		{1, "User1"},
		{2, "User2"},
	}
	posts := []Post{
		{"Hi", "User1", 10},
		{"Hello", "User2", 20},
	}

	showFields(users)
	showFields(posts)
}
