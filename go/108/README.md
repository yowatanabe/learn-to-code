# No.108

Goのエラー処理の基礎を学ぶ。

## **コードの説明**

### **1. `error` インターフェースと `errors` パッケージの利用**

```go
return "", fmt.Errorf("ファイルが見つかりません: %s", filename)
```

- `fmt.Errorf` を使って、エラーメッセージをフォーマット。

```go
return "", fmt.Errorf("ファイル読み込みエラー: %w", err)
```

- `%w` を使ってエラーをラップし、元のエラーを保持。

### **2. カスタムエラーの定義**

```go
var ErrPermissionDenied = errors.New("パーミッションエラー: アクセスが拒否されました")
```

- `errors.New` を使ってカスタムエラーを作成。

### **3. `errors.Is` を使ったエラーの判定**

```go
if errors.Is(err, ErrPermissionDenied) {
	fmt.Println("カスタムエラー:", err)
}
```

- `errors.Is` を使って、カスタムエラーを識別。

## **実行結果（存在しないファイルを対象とした場合）**

```plaintext
=== ファイル読み込みテスト ===
エラー: ファイルが見つかりません: nonexistent.txt

=== ファイル削除テスト ===
エラー: ファイル削除エラー: remove nonexistent.txt: no such file or directory
```
