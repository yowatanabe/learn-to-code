# No.105

Goの関数の基本（引数、戻り値、複数戻り値、可変長引数、`defer`）を学ぶ。

### **引数を複数受け取って合計を返す関数**

```go
func add(a int, b int) int {
	return a + b
}
```

- **説明**:
  - 引数 `a` と `b` を受け取り、その合計を返します。
  - 戻り値の型は `int` です。

---

### **複数戻り値を持つ関数**

```go
func divide(a int, b int) (int, int, error) {
	if b == 0 {
		return 0, 0, errors.New("割り算の分母が0です")
	}
	quotient := a / b
	remainder := a % b
	return quotient, remainder, nil
}
```

- **説明**:
  - 引数 `a` を `b` で割り、商 (`quotient`) と余り (`remainder`) を返します。
  - 分母が0の場合はエラーを返します。
  - 複数の戻り値 (`int`, `int`, `error`) を使用しています。

---

### **可変長引数を使った関数**

```go
func sumAll(numbers ...int) int {
	total := 0
	for _, num := range numbers {
		total += num
	}
	return total
}
```

- **説明**:
  - 可変長引数 `...int` を使用して、任意の数の整数を受け取ります。
  - すべての数を加算し、合計を返します。

---

### **`defer` を使った関数**

```go
func deferExample() {
	defer fmt.Println("1. defer: これは最後に実行されます")
	fmt.Println("2. 通常の処理: これは最初に実行されます")
	defer fmt.Println("3. defer: これは最後から2番目に実行されます")
	fmt.Println("4. 通常の処理: これも通常通り実行されます")
}
```

- **説明**:
  - `defer` キーワードを使うと、関数の終了時に指定された処理を遅延実行します。
  - 複数の `defer` がある場合、後から指定されたものが先に実行されます（LIFO）。

---

### **実行結果**

```plaintext
=== 合計を返す関数 ===
10 + 20 = 30

=== 複数戻り値の関数 ===
20 ÷ 3 = 6 (余り: 2)

=== 可変長引数の関数 ===
1 + 2 + 3 + 4 + 5 = 15

=== defer の例 ===
2. 通常の処理: これは最初に実行されます
4. 通常の処理: これも通常通り実行されます
3. defer: これは最後から2番目に実行されます
1. defer: これは最後に実行されます
```
