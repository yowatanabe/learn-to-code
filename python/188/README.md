# No.188

## 問題文

エンコードされた文字列 `s` が与えられます。

形式は `k[encoded_string]` で、`encoded_string` は文字列、`k` は正の整数（1以上）です。

入れ子（ネスト）も許されます。`s` をデコードした結果の文字列を返してください。

* 例: `"3[a2[c]]"` → `"accaccacc"`
* `1 <= len(s) <= 3 * 10^5`
* `s` は小文字英字、数字、括弧 `[]` を含み、入力は常に妥当（括弧対応は取れている）とします。

## 実行例

```
入力: s = "3[a]2[bc]"
出力: "aaabcbc"

入力: s = "3[a2[c]]"
出力: "accaccacc"

入力: s = "2[ab3[c]]d"
出力: "abcccabcccd"

入力: s = "10[z]"
出力: "zzzzzzzzzz"
```

## 実行結果

```
aaabcbc
accaccacc
abcccabcccd
zzzzzzzzzz
```
