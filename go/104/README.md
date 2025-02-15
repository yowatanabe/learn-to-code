# No.104

Go言語で`for`文を使って **フィボナッチ数列** と **九九の表** を出力するプログラムの例。
条件分岐や`switch`も使用している。

### **フィボナッチ数列**

```go
func fibonacci(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Printf("%d ", a)
		a, b = b, a+b
	}
	fmt.Println()
}
```

- **説明**:
  1. 初期値 `a = 0`, `b = 1` を設定。
  2. `for` ループでフィボナッチ数列を計算しながら出力。
  3. `a, b = b, a+b` で次のフィボナッチ数を生成。

---

### **九九の表**

```go
func timesTable() {
	for i := 1; i <= 9; i++ {
		for j := 1; j <= 9; j++ {
			fmt.Printf("%d x %d = %2d\t", i, j, i*j)
		}
		fmt.Println()
	}
}
```

- **説明**:
  1. 二重の `for` ループを使用して、1～9の掛け算の結果を計算。
  2. `fmt.Printf` を使って整形された出力を実現。
  3. 内側のループで掛け算を実行、外側のループで行を切り替え。

---

### **条件分岐と `switch` の例**

```go
func checkNumber(num int) {
	switch {
	case num%3 == 0 && num%5 == 0:
		fmt.Printf("%dは3と5の両方で割り切れる (FizzBuzz)\n", num)
	case num%3 == 0:
		fmt.Printf("%dは3で割り切れる (Fizz)\n", num)
	case num%5 == 0:
		fmt.Printf("%dは5で割り切れる (Buzz)\n", num)
	default:
		fmt.Printf("%dは3でも5でも割り切れない\n", num)
	}

	// fallthrough の例 (条件を無視して次のケースに進む)
	switch num {
	case 10:
		fmt.Println("数値は10です")
		fallthrough
	case 20:
		fmt.Println("数値は20か10です (fallthrough)")
	default:
		fmt.Println("fallthroughがここに来ました")
	}
}
```

- **説明**:
  1. **最初の`switch`**:
     - 条件を `num%3 == 0 && num%5 == 0` のように複数条件で評価。
     - 条件に応じて異なるメッセージを出力。
  2. **`fallthrough` の例**:
     - `fallthrough` を使うと、次のケースに強制的に進む。
     - デフォルトでは`fallthrough`は自動的に行われないため、明示的に指定する必要がある。

---

### **実行結果**

```plaintext
=== フィボナッチ数列 ===
0 1 1 2 3 5 8 13 21 34

=== 九九の表 ===
1 x 1 =  1	1 x 2 =  2	1 x 3 =  3	1 x 4 =  4	1 x 5 =  5	1 x 6 =  6	1 x 7 =  7	1 x 8 =  8	1 x 9 =  9
2 x 1 =  2	2 x 2 =  4	2 x 3 =  6	2 x 4 =  8	2 x 5 = 10	2 x 6 = 12	2 x 7 = 14	2 x 8 = 16	2 x 9 = 18
...
9 x 1 =  9	9 x 2 = 18	9 x 3 = 27	9 x 4 = 36	9 x 5 = 45	9 x 6 = 54	9 x 7 = 63	9 x 8 = 72	9 x 9 = 81

=== 条件分岐とswitchの例 ===
10は5で割り切れる (Buzz)
数値は10です
数値は20か10です (fallthrough)
fallthroughがここに来ました
25は5で割り切れる (Buzz)
fallthroughがここに来ました
30は3と5の両方で割り切れる (FizzBuzz)
fallthroughがここに来ました
```

---

### **学びのポイント**

1. **`for` を活用した繰り返し処理**:
   - フィボナッチ数列や九九のような計算処理に使える。
   - `for` は条件を柔軟に設定可能。

2. **`switch` の条件分岐**:
   - 複数の条件を評価するケースに適している。
   - `fallthrough` を活用すると、次のケースに進む動作を試せる。

3. **可読性の向上**:
   - `fmt.Printf` で整形された出力を利用することで、わかりやすい出力が可能。

これをベースに、さらなる条件やループを加えて実験してみてください！
