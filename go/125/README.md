# No.125

Go で MySQL に接続し、データを INSERT / SELECT する。<br>
ORM は使わずに、標準の `database/sql` パッケージ を使用する。

## **1. 事前準備**

### **(1) 必要なパッケージのインストール**

```sh
go get -u github.com/go-sql-driver/mysql
```

### **(2) ローカルにMySQLを起動

```sql
docker run --rm --name mysql -v `pwd`:`pwd` -w `pwd` -it -e MYSQL_ROOT_PASSWORD=password -d -p 3306:3306 mysql
```

### **(3) MySQL データベース作成**

```sql
CREATE DATABASE go_test;
USE go_test;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
```

## **2. `main.go`（DB 接続 & INSERT / SELECT）**

```go
package main

import (
    "database/sql"
    "fmt"
    "log"

    _ "github.com/go-sql-driver/mysql"
)

// User 構造体
type User struct {
    ID    int
    Name  string
    Email string
}

func main() {
    // MySQL 接続情報
    dsn := "root:password@tcp(127.0.0.1:3306)/go_test?parseTime=true"
    db, err := sql.Open("mysql", dsn)
    if err != nil {
        log.Fatal("DB接続エラー:", err)
    }
    defer db.Close()

    // データを挿入
    insertUser(db, "Alice", "alice@example.com")
    insertUser(db, "Bob", "bob@example.com")

    // データを取得
    users, err := getUsers(db)
    if err != nil {
        log.Fatal("データ取得エラー:", err)
    }

    fmt.Println("取得したユーザー一覧:")
    for _, user := range users {
        fmt.Printf("ID: %d, Name: %s, Email: %s\n", user.ID, user.Name, user.Email)
    }
}

// ユーザーを追加
func insertUser(db *sql.DB, name, email string) {
    query := "INSERT INTO users (name, email) VALUES (?, ?)"
    _, err := db.Exec(query, name, email)
    if err != nil {
        log.Fatal("INSERTエラー:", err)
    }
    fmt.Println("ユーザー追加:", name)
}

// ユーザー一覧を取得
func getUsers(db *sql.DB) ([]User, error) {
    query := "SELECT id, name, email FROM users"
    rows, err := db.Query(query)
    if err != nil {
        return nil, err
    }
    defer rows.Close()

    var users []User
    for rows.Next() {
        var user User
        if err := rows.Scan(&user.ID, &user.Name, &user.Email); err != nil {
            return nil, err
        }
        users = append(users, user)
    }
    return users, nil
}
```

## **3. 実行方法**

```sh
go run main.go
```

**成功すると以下のように表示**

```
ユーザー追加: Alice
ユーザー追加: Bob
取得したユーザー一覧:
ID: 1, Name: Alice, Email: alice@example.com
ID: 2, Name: Bob, Email: bob@example.com
```

## **4. コードのポイント**

- `sql.Open("mysql", dsn)` で **MySQL に接続**
- `db.Exec("INSERT INTO users ...")` で **データを追加**
- `db.Query("SELECT * FROM users")` で **データを取得**
- `rows.Scan(&user.ID, &user.Name, &user.Email)` で **データを構造体にマッピング**
