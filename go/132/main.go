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
