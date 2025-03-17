package main

import (
	"fmt"
	"log"
	"os"

	"github.com/spf13/viper"
)

// 設定の構造体
type Config struct {
    App struct {
        Name string
        Mode string
    }
    Server struct {
        Port     int
        LogLevel string
    }
}

// 設定をロードする関数
func loadConfig() (*Config, error) {
    viper.SetConfigName("config")  // 設定ファイル名（拡張子なし）
    viper.SetConfigType("yaml")    // 設定ファイルのフォーマット
    viper.AddConfigPath(".")       // カレントディレクトリを検索

    // 環境変数の設定（優先）
    viper.AutomaticEnv()

    // デフォルト値を設定
    viper.SetDefault("server.port", 8080)
    viper.SetDefault("server.log_level", "info")

    // 設定ファイルの読み込み
    if err := viper.ReadInConfig(); err != nil {
        return nil, err
    }

    var config Config
    if err := viper.Unmarshal(&config); err != nil {
        return nil, err
    }

    return &config, nil
}

func main() {
    config, err := loadConfig()
    if err != nil {
        log.Fatalf("設定の読み込みに失敗: %v", err)
    }

    fmt.Printf("アプリ名: %s\n", config.App.Name)
    fmt.Printf("環境モード: %s\n", config.App.Mode)
    fmt.Printf("サーバー起動ポート: %d\n", config.Server.Port)
    fmt.Printf("ログレベル: %s\n", config.Server.LogLevel)

    // 環境変数を確認（例: SERVER_PORT を環境変数から取得）
    envPort := os.Getenv("SERVER_PORT")
    if envPort != "" {
        fmt.Printf("環境変数 SERVER_PORT: %s\n", envPort)
    }
}
