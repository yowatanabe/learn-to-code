# No.102

Goの変数や定数の使い方を学ぶ

### **コードの説明**

1. **定数宣言**:
   ```go
   const greeting string = "Hello"
   const pi float64 = 3.14159
   ```
   - 定数は値が固定で変更できません。型を明示的に指定しています。

2. **変数宣言**:
   ```go
   var name string = "Alice"
   var age int = 25
   var height float64 = 5.5
   var isStudent bool = true
   ```
   - `var` を使って明示的に型を指定して変数を宣言しています。

3. **短縮変数宣言**:
   ```go
   country := "Japan"
   weight := 55.4
   ```
   - `:=` を使うと型を明示的に指定せず、初期値から型が推論されます。
   - 関数内でのみ使用可能です。

4. **演算**:
   ```go
   totalHeight := height + 0.5
   nextAge := age + 1
   isAdult := age >= 18
   ```
   - 数値型では加算、浮動小数点演算を行い、`bool` 型の比較結果を格納しています。

5. **文字列連結**:
   ```go
   fullGreeting := greeting + ", " + name + "!"
   ```
   - `+` 演算子を使って文字列を連結しています。

6. **スコープ**:
   ```go
   if isAdult {
       status := "Adult"
       fmt.Println("Status:", status)
   }
   // fmt.Println(status) // コンパイルエラー
   ```
   - `if` ブロック内で宣言された変数はそのスコープ内でのみアクセス可能です。

---

### **実行結果**

```plaintext
Hello, Alice!
Age: 25, Next Year Age: 26
Height: 5.5, Total Height: 6.0
Country: Japan, Weight: 55.4 kg
Is Student: true, Is Adult: true
Value of Pi: 3.14159
Status: Adult
```
