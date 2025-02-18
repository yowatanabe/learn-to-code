package main

import (
	"fmt"
)

// ユーザーの構造体
type User struct {
	Name  string
	Email string
	Age   int
}

// User に関連付けるメソッド
func (u User) Display() {
	fmt.Printf("User: %s, Email: %s, Age: %d\n", u.Name, u.Email, u.Age)
}

// 商品の構造体
type Product struct {
	Name  string
	Price float64
	Stock int
}

// Product に関連付けるメソッド
func (p Product) Display() {
	fmt.Printf("Product: %s, Price: %.2f, Stock: %d\n", p.Name, p.Price, p.Stock)
}

// 汎用的に表示するためのインターフェース
type Displayable interface {
	Display()
}

// 汎用的に情報を表示する関数
func ShowInfo(d Displayable) {
	d.Display()
}

func main() {
	// User インスタンスの作成
	user := User{Name: "Alice", Email: "alice@example.com", Age: 28}
	// Product インスタンスの作成
	product := Product{Name: "Laptop", Price: 1200.99, Stock: 5}

	// メソッドの呼び出し
	fmt.Println("=== User 情報 ===")
	user.Display()

	fmt.Println("\n=== Product 情報 ===")
	product.Display()

	// インターフェースを使って汎用的に表示
	fmt.Println("\n=== Displayable インターフェース ===")
	ShowInfo(user)
	ShowInfo(product)
}
