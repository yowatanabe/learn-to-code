# No.107

`struct`、メソッド、`interface` の基礎を学ぶ。

## **コードの説明**

### **1. `struct` の定義**

```go
type User struct {
	Name  string
	Email string
	Age   int
}
```

- `User` 構造体を定義し、`Name`, `Email`, `Age` をフィールドとして持つ。

```go
type Product struct {
	Name  string
	Price float64
	Stock int
}
```

- `Product` 構造体を定義し、`Name`, `Price`, `Stock` をフィールドとして持つ。

### **2. `struct` に関連付けたメソッド**

```go
func (u User) Display() {
	fmt.Printf("User: %s, Email: %s, Age: %d\n", u.Name, u.Email, u.Age)
}
```

- `User` に `Display` メソッドを定義し、ユーザー情報を表示。

```go
func (p Product) Display() {
	fmt.Printf("Product: %s, Price: %.2f, Stock: %d\n", p.Name, p.Price, p.Stock)
}
```

- `Product` に `Display` メソッドを定義し、商品情報を表示。

### **3. `interface` を定義**

```go
type Displayable interface {
	Display()
}
```

- `Display` メソッドを持つ `Displayable` インターフェースを定義。

```go
func ShowInfo(d Displayable) {
	d.Display()
}
```

- `Displayable` インターフェースを満たす型（`User` と `Product`）を受け取り、汎用的に `Display` メソッドを呼び出す関数。


### **4. `main` 関数で実行**

```go
user := User{Name: "Alice", Email: "alice@example.com", Age: 28}
product := Product{Name: "Laptop", Price: 1200.99, Stock: 5}
```

- `User` と `Product` のインスタンスを作成。

```go
user.Display()
product.Display()
```

- それぞれの `Display` メソッドを実行。

```go
ShowInfo(user)
ShowInfo(product)
```

- `interface` を使って汎用的に `Display` を呼び出し。


## **実行結果**

```plaintext
=== User 情報 ===
User: Alice, Email: alice@example.com, Age: 28

=== Product 情報 ===
Product: Laptop, Price: 1200.99, Stock: 5

=== Displayable インターフェース ===
User: Alice, Email: alice@example.com, Age: 28
Product: Laptop, Price: 1200.99, Stock: 5
```
