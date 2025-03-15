# No.132

Go の `promhttp` を使って Prometheus メトリクスエンドポイントを追加するサンプルコード

## **1. 事前準備**

### **(1) 必要なパッケージのインストール**

```sh
go get -u github.com/prometheus/client_golang/prometheus
go get -u github.com/prometheus/client_golang/prometheus/promhttp
```

## **2. `main.go`（Prometheus メトリクス付き HTTP サーバー）**

```go
package main

import (
    "fmt"
    "net/http"
    "time"

    "github.com/prometheus/client_golang/prometheus"
    "github.com/prometheus/client_golang/prometheus/promhttp"
)

// カスタムメトリクス
var (
    httpRequestsTotal = prometheus.NewCounterVec(
        prometheus.CounterOpts{
            Name: "http_requests_total",
            Help: "Total number of HTTP requests",
        },
        []string{"path"},
    )

    httpRequestDuration = prometheus.NewHistogramVec(
        prometheus.HistogramOpts{
            Name:    "http_request_duration_seconds",
            Help:    "Histogram of response time for handler",
            Buckets: prometheus.DefBuckets,
        },
        []string{"path"},
    )
)

func init() {
    // メトリクスを Prometheus に登録
    prometheus.MustRegister(httpRequestsTotal)
    prometheus.MustRegister(httpRequestDuration)
}

// メトリクスを記録するミドルウェア
func metricsMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        path := r.URL.Path

        // リクエストカウントを増加
        httpRequestsTotal.WithLabelValues(path).Inc()

        // レスポンス時間を計測
        timer := prometheus.NewTimer(httpRequestDuration.WithLabelValues(path))
        defer timer.ObserveDuration()

        next.ServeHTTP(w, r)
    })
}

// シンプルなハンドラ
func helloHandler(w http.ResponseWriter, r *http.Request) {
    time.Sleep(100 * time.Millisecond) // 遅延シミュレーション
    fmt.Fprintln(w, "Hello, Prometheus!")
}

func main() {
    mux := http.NewServeMux()
    mux.HandleFunc("/", helloHandler)

    // Prometheus メトリクスエンドポイント
    mux.Handle("/metrics", promhttp.Handler())

    // メトリクスミドルウェアを適用
    wrappedMux := metricsMiddleware(mux)

    fmt.Println("サーバーをポート8080で起動中...")
    http.ListenAndServe(":8080", wrappedMux)
}
```

## **3. 実行方法**

```sh
go run main.go
```

**成功すると表示**

```
サーバーをポート8080で起動中...
```

## **4. 動作確認**

### **(1) 通常のエンドポイント**

```sh
curl http://localhost:8080/
```

**レスポンス**

```
Hello, Prometheus!
```

### **(2) メトリクスエンドポイント**

```sh
curl http://localhost:8080/metrics
```

**レスポンス (メトリクスが表示される)**

```
# HELP go_gc_duration_seconds A summary of the wall-time pause (stop-the-world) duration in garbage collection cycles.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 0
go_gc_duration_seconds{quantile="0.25"} 0
go_gc_duration_seconds{quantile="0.5"} 0
go_gc_duration_seconds{quantile="0.75"} 0
go_gc_duration_seconds{quantile="1"} 0
go_gc_duration_seconds_sum 0
go_gc_duration_seconds_count 0
...
# HELP promhttp_metric_handler_requests_total Total number of scrapes by HTTP status code.
# TYPE promhttp_metric_handler_requests_total counter
promhttp_metric_handler_requests_total{code="200"} 0
promhttp_metric_handler_requests_total{code="500"} 0
promhttp_metric_handler_requests_total{code="503"} 0
```

## **5. Prometheus との連携**

### **(1) `prometheus.yml` を作成**

```yaml
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: "go_app"
    static_configs:
      - targets: ["host.docker.internal:8080"]
```

### **(2) Prometheus を起動**

```sh
docker run -d --name prometheus -p 9090:9090 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
```

**Prometheus の Web UI にアクセス**

```
http://localhost:9090
```

**メトリクスを確認**

1. `Table`や`Graph`タブを開く

2. 上部の検索ボックスに、取得したいメトリクス名を入力（例: go_gc_duration_seconds）

    ```plaintext
    go_gc_duration_seconds
    promhttp_metric_handler_requests_total
    など
    ```

3. [Execute] ボタンをクリック

4. テーブル表示 or グラフ表示 で結果を確認
