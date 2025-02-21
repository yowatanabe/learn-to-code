# No.110

Goの標準ライブラリ `net/http` を使って、シンプルなHTTPサーバーを作成する

## **1. `net/http` パッケージとは？**

`net/http` は、Goの標準ライブラリに含まれるHTTPクライアント・サーバーを実装するためのパッケージです。

- **サーバー** を作成する
- **クライアント** を作成する
- **リクエスト/レスポンスの制御** を行う

公式ドキュメント：
🔗 [https://pkg.go.dev/net/http](https://pkg.go.dev/net/http)


## **2. コードの説明**

1. `http.HandleFunc("/", helloHandler)`
   - ルート (`/`) にアクセスしたときに `helloHandler` を実行。
2. `http.HandleFunc("/status", statusHandler)`
   - `/status` にアクセスしたときに `statusHandler` を実行。
3. `http.ListenAndServe(":8080", nil)`
   - ポート `8080` でHTTPサーバーを起動。


## **3. 実行と動作確認**

1. **サーバーを起動**

   ```sh
   go run main.go
   ```

   **出力**

   ```plaintext
   Starting server at http://localhost:8080/
   ```

2. **動作確認**
   - ブラウザまたは `curl` でアクセス

   **ルート (`/`) にアクセス**

   ```sh
   curl http://localhost:8080/
   ```

   **レスポンス**

   ```plaintext
   Hello, World! This is a Go HTTP server.
   ```

   **ステータスチェック (`/status`) にアクセス**

   ```sh
   curl http://localhost:8080/status
   ```

   **レスポンス**

   ```json
   {"status": "OK"}
   ```

## **4. ベストプラクティス**

1. **エラーハンドリングを明示的に行う**

   ```go
   if err := http.ListenAndServe(":8080", nil); err != nil {
       log.Fatalf("サーバーの起動に失敗しました: %v", err)
   }
   ```

   - `log.Fatalf` を使って、エラーが発生したらサーバーを停止。

2. **構造化されたルーティングを使う**

   ```go
   mux := http.NewServeMux()
   mux.HandleFunc("/", helloHandler)
   mux.HandleFunc("/status", statusHandler)
   http.ListenAndServe(":8080", mux)
   ```

   - `http.NewServeMux()` を使うことで、ルーティングの管理がしやすくなる。
