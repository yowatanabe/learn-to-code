# No.131

*Go の `zap` ロギングライブラリを使用して構造化ログを出力するサンプルコード。

## **1. `zap` のインストール**

まず、`zap` をインストールします。

```sh
go get -u go.uber.org/zap
```

## **2. `main.go`（zap を使用したロギングサンプル）**

```go
package main

import (
    "errors"
    "go.uber.org/zap"
)

func main() {
    // ロガーの設定 (デフォルトは高速な `zap.NewProduction` を使用)
    logger, err := zap.NewProduction()
    if err != nil {
        panic("Loggerの初期化に失敗しました")
    }
    defer logger.Sync()

    // 基本的なログ出力
    logger.Info("アプリケーションが起動しました")

    // 構造化ログの例 (フィールド付き)
    logger.Info("ユーザーがログインしました",
        zap.String("username", "alice"),
        zap.Int("userID", 123),
    )

    // エラーログの出力
    err = errors.New("データベース接続エラー")
    logger.Error("エラー発生", zap.Error(err))

    // Debug ログ (通常は本番環境では無効化)
    logger.Debug("デバッグ情報", zap.String("context", "some debug data"))

    // Fatal (プログラム終了)
    // logger.Fatal("致命的なエラー", zap.String("reason", "panic triggered"))
}
```

## **3. 実行方法**

```sh
go run main.go
```

**出力例**

```
{"level":"info","ts":1711952000.123456,"caller":"main.go:14","msg":"アプリケーションが起動しました"}
{"level":"info","ts":1711952000.123789,"caller":"main.go:17","msg":"ユーザーがログインしました","username":"alice","userID":123}
{"level":"error","ts":1711952000.124012,"caller":"main.go:22","msg":"エラー発生","error":"データベース接続エラー"}
{"level":"debug","ts":1711952000.124345,"caller":"main.go:26","msg":"デバッグ情報","context":"some debug data"}
```

## **4. `zap` を選んだ理由**

- **構造化ログの出力が簡単** (JSONフォーマット)
- **パフォーマンスが高い** (`logrus` より 10 倍以上速い)
- **レベル別ログ (`Info`, `Debug`, `Error`, `Fatal`) を分けて出力**

## **5. `logrus` を使いたい場合**

もし `logrus` を試したい場合は、以下のコードを使用できます。

### **(1) インストール**

```sh
go get -u github.com/sirupsen/logrus
```

### **(2) `logrus` 版の `main.go`**

```go
package main

import (
    "errors"
    "github.com/sirupsen/logrus"
)

func main() {
    log := logrus.New()
    log.SetFormatter(&logrus.JSONFormatter{}) // JSON 形式に変更

    log.Info("アプリケーションが起動しました")

    log.WithFields(logrus.Fields{
        "username": "alice",
        "userID":   123,
    }).Info("ユーザーがログインしました")

    err := errors.New("データベース接続エラー")
    log.WithError(err).Error("エラー発生")

    log.Debug("デバッグ情報", logrus.Fields{"context": "some debug data"})
}
```

**`logrus` も `zap` と同様に構造化ログを出力できます**
ただし、パフォーマンス面では `zap` の方が優れているため、SRE向けには `zap` を推奨します。

---

## **6. まとめ**

- **`zap` は高パフォーマンスなロギングライブラリ**
- **構造化ログを JSON 形式で簡単に出力できる**
- **`logrus` も使えるが、パフォーマンスを考慮すると `zap` が最適**
