# No.138

### **問題: 文字列の単語を反転する (Reverse Words in a String)**

与えられた文字列 `s` は **単語ごとにスペースで区切られた文** です。
この文字列内の **各単語を反転** し、単語の順序はそのままにする関数 `reverseWords` を実装してください。

**制約:**

- `s` は **英小文字・大文字・数字・スペース** のみで構成される。
- `1 <= s.length <= 10^4`
- `s` には少なくとも **1 つの単語が含まれる**。

### **🔹 実行例**

#### **Example 1**

```
Input:  s = "hello world"
Output: "olleh dlrow"
```

#### **Example 2**

```
Input:  s = "Go is fun"
Output: "oG si nuf"
```

#### **Example 3**

```
Input:  s = "  a b   c  "
Output: "  a b   c  "
Explanation: スペースの位置は変更しない
```

### **実行結果**

```sh
$ go run main.go
olleh dlrow
oG si nuf
  a b   c
```
