package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"os"
)

// ファイルを読み込む関数
func readFile(filename string) (string, error) {
	// ファイルが存在するかチェック
	if _, err := os.Stat(filename); os.IsNotExist(err) {
		return "", fmt.Errorf("ファイルが見つかりません: %s", filename)
	}

	// ファイルを読み込む
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		return "", fmt.Errorf("ファイル読み込みエラー: %w", err) // %w を使ってエラーをラップ
	}

	return string(data), nil
}

// カスタムエラー
var ErrPermissionDenied = errors.New("パーミッションエラー: アクセスが拒否されました")

// ファイル削除の関数
func deleteFile(filename string) error {
	err := os.Remove(filename)
	if err != nil {
		if os.IsPermission(err) {
			return ErrPermissionDenied
		}
		return fmt.Errorf("ファイル削除エラー: %w", err)
	}
	return nil
}

func main() {
	// 存在しないファイルを開こうとする（エラー処理をテスト）
	filename := "nonexistent.txt"
	fmt.Println("=== ファイル読み込みテスト ===")
	content, err := readFile(filename)
	if err != nil {
		fmt.Println("エラー:", err)
	} else {
		fmt.Println("ファイル内容:", content)
	}

	// 存在しないファイルを削除しようとする（エラー処理をテスト）
	fmt.Println("\n=== ファイル削除テスト ===")
	err = deleteFile(filename)
	if err != nil {
		if errors.Is(err, ErrPermissionDenied) {
			fmt.Println("カスタムエラー:", err)
		} else {
			fmt.Println("エラー:", err)
		}
	} else {
		fmt.Println("ファイル削除成功")
	}
}
