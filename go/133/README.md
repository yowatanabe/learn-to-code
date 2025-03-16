# No.133

*Go の OpenTelemetry (`otel`) を使用して、HTTP ハンドラでトレース ID を取得・出力するサンプルコード

## **1. OpenTelemetry のセットアップ**

必要なパッケージをインストール

```sh
go get -u go.opentelemetry.io/otel
go get -u go.opentelemetry.io/otel/trace
go get -u go.opentelemetry.io/otel/sdk/trace
go get -u go.opentelemetry.io/otel/propagation
go get -u go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
```

---

## **2. `main.go`（トレース ID を取得する HTTP サーバー）**

```go
package main

import (
    "context"
    "fmt"
    "log"
    "net/http"

    "go.opentelemetry.io/otel"
    "go.opentelemetry.io/otel/propagation"
    "go.opentelemetry.io/otel/sdk/trace"
    "go.opentelemetry.io/otel/trace"
    "go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
)

// トレースプロバイダの初期化
func initTracer() *trace.TracerProvider {
    tp := trace.NewTracerProvider()
    otel.SetTracerProvider(tp)
    return tp
}

// トレース ID を取得するハンドラ
func traceHandler(w http.ResponseWriter, r *http.Request) {
    ctx := r.Context()
    tracer := otel.Tracer("example-tracer")
    ctx, span := tracer.Start(ctx, "traceHandler")
    defer span.End()

    // トレース ID を取得
    spanContext := span.SpanContext()
    traceID := spanContext.TraceID().String()

    log.Printf("トレース ID: %s", traceID)
    fmt.Fprintf(w, "Trace ID: %s\n", traceID)
}

func main() {
    tp := initTracer()
    defer func() { _ = tp.Shutdown(context.Background()) }()

    mux := http.NewServeMux()
    mux.Handle("/trace", otelhttp.NewHandler(http.HandlerFunc(traceHandler), "traceHandler"))

    fmt.Println("サーバーをポート 8080 で起動中...")
    log.Fatal(http.ListenAndServe(":8080", mux))
}
```

## **3. 実行方法**

```sh
go run main.go
```

**成功すると以下のログが出力**

```
サーバーをポート 8080 で起動中...
```

## **4. 動作確認**

### **1. `curl` でリクエスト**

```sh
curl http://localhost:8080/trace
```

**レスポンス**

```
Trace ID: 670073f34ecd1bba09a8c9d78fafc0d6
```

## **5. コードのポイント**

1. **`trace.NewTracerProvider()` を使用して OpenTelemetry のトレースを設定**
2. **`tracer.Start(ctx, "traceHandler")` で新しいスパンを作成**
3. **`span.SpanContext().TraceID()` でトレース ID を取得**
4. **`otelhttp.NewHandler()` で OpenTelemetry を HTTP ハンドラに適用**

このサンプルはローカルのトレース ID を取得するだけですが、
**Jaeger や Zipkin などのトレーシングシステムと連携** すれば、分散トレースを可視化できます。
