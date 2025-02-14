# No.103

Goでスライスとマップの基本的な操作を学ぶ。

### **コードの説明**

#### **スライスの操作**
1. **スライスの初期化**:
   ```go
   numbers := []int{1, 2, 3, 4}
   ```
   - スライスは可変長の配列として扱います。

2. **スライスへの要素の追加**:
   ```go
   numbers = append(numbers, 5, 6)
   ```
   - `append` を使用して要素を追加できます。

3. **スライスから要素を削除**:
   ```go
   numbers = append(numbers[:indexToRemove], numbers[indexToRemove+1:]...)
   ```
   - インデックス `indexToRemove` の要素を削除します。
   - 削除は新しいスライスを作成する形で実現します。

4. **range を使った繰り返し処理**:
   ```go
   for i, num := range numbers {
       fmt.Printf("Index: %d, Value: %d\n", i, num)
   }
   ```
   - `range` を使ってスライス内のインデックスと値を取得します。

---

#### **マップの操作**
1. **マップの初期化**:
   ```go
   employeeSalaries := map[string]int{
       "Alice": 50000,
       "Bob":   60000,
       "Charlie": 70000,
   }
   ```
   - マップはキーと値のペアを保持します。

2. **マップへの要素の追加または更新**:
   ```go
   employeeSalaries["Diana"] = 80000 // 新しい要素を追加
   employeeSalaries["Alice"] = 55000 // 既存の要素を更新
   ```

3. **マップから要素を削除**:
   ```go
   delete(employeeSalaries, "Bob")
   ```
   - `delete` を使用して指定されたキーの要素を削除します。

4. **range を使った繰り返し処理**:
   ```go
   for name, salary := range employeeSalaries {
       fmt.Printf("Name: %s, Salary: %d\n", name, salary)
   }
   ```
   - `range` を使ってマップ内のキーと値を取得します。

---

### **実行結果**

```plaintext
=== スライスの操作 ===
初期スライス: [1 2 3 4]
要素追加後: [1 2 3 4 5 6]
要素削除後: [1 2 4 5 6]
スライスの要素を繰り返し処理:
Index: 0, Value: 1
Index: 1, Value: 2
Index: 2, Value: 4
Index: 3, Value: 5
Index: 4, Value: 6

=== マップの操作 ===
初期マップ: map[Alice:50000 Bob:60000 Charlie:70000]
要素追加・更新後: map[Alice:55000 Bob:60000 Charlie:70000 Diana:80000]
要素削除後: map[Alice:55000 Charlie:70000 Diana:80000]
マップの要素を繰り返し処理:
Name: Alice, Salary: 55000
Name: Charlie, Salary: 70000
Name: Diana, Salary: 80000
```
