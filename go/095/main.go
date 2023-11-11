package main

import (
	"fmt"
	"os"

	"golang.org/x/crypto/ssh"
)

func isValidSSHKey(keyPath string) bool {
	// ファイル読み込み
	keyBytes, err := os.ReadFile(keyPath)
	if err != nil {
		fmt.Println("ファイル読み込みエラー：", err)
		os.Exit(1)
	}

	// ファイルを解析
	_, err = ssh.ParsePrivateKey(keyBytes)
	return err == nil
}

func main() {
	// コマンドライン引数からファイルパスを取得
	if len(os.Args) < 2 {
		fmt.Println("使用法: go run main.go <SSHキーファイルのパス>")
		os.Exit(1)
	}
	keyPath := os.Args[1]

	// ファイルの存在を確認
	if _, err := os.Stat(keyPath); os.IsNotExist(err) {
		fmt.Println("エラー: ファイルが見つかりませんでした")
		os.Exit(1)
	}

	// SSHキーの検証
	if isValidSSHKey(keyPath) {
		fmt.Println("SSHキーは有効です")
	} else {
		fmt.Println("SSHキーは無効です")
	}
}
