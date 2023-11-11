package main

import (
	"bufio"
	"fmt"
	"os"
)

type User struct {
	Name     string
	Age      int
	Language string
}

func askQuestion(question string, answer interface{}) {
	fmt.Println(question)
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()

	switch v := answer.(type) {
	case *string:
		*v = scanner.Text()
	case *int:
		fmt.Sscanf(scanner.Text(), "%d", v)
	}
}

func displayUserInfo(user User) {
	fmt.Println("ユーザー情報")
	fmt.Printf("名前: %s\n", user.Name)
	fmt.Printf("年齢: %d\n", user.Age)
	fmt.Printf("好きなプログラミング言語: %s\n", user.Language)
}

func main() {
	user := User{}

	askQuestion("名前を教えてください", &user.Name)
	askQuestion("年齢を教えてください", &user.Age)
	askQuestion("好きなプログラミング言語を教えてください", &user.Language)

	displayUserInfo(user)
}
