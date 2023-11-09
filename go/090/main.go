package main

import "fmt"

type User struct {
	Name string
	Age  int
}

func printUserInfo(u User) {
	fmt.Printf("名前: %s\n", u.Name)
	fmt.Printf("年齢: %d\n", u.Age)
}

func main() {
	user := User{
		Name: "ユーザーA",
		Age:  30,
	}

	printUserInfo(user)
}
