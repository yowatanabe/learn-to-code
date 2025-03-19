# 1. ビルド用のステージ
FROM golang:1.24.1 AS builder
WORKDIR /app

# 必要なファイルをコピー
COPY go.mod ./
RUN go mod tidy

# ソースコードをコピー
COPY . .

# 静的リンクでビルド
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

# 2. 実行用の軽量イメージ（Alpine ベース）
FROM alpine:latest
WORKDIR /app

# ビルド済みのバイナリをコピー
COPY --from=builder /app/app .

# ポート 8080 を開放
EXPOSE 8080

# アプリを実行
CMD ["./app"]
