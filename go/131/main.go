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
