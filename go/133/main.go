package main

import (
	"context"
	"fmt"
	"log"
	"net/http"

	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/sdk/trace"
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
