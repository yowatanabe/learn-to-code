package main

import "fmt"

type User struct {
	Username string
	Age      int
}

func printUsersOver30(users map[string]User) {
	fmt.Println("30歳以上のユーザーの情報を表示します:")
	for _, user := range users {
		if user.Age >= 30 {
			fmt.Printf("ユーザー名: %s, 年齢: %d\n", user.Username, user.Age)
		}
	}
}

func main() {
	users := map[string]User{
		"User1": {"User1", 10},
		"User2": {"User2", 20},
		"User3": {"User3", 30},
	}

	printUsersOver30(users)
}
