package main

import (
	"fmt"
	"io"
	"net/http"
)

func main() {
	var url string

	fmt.Print("URLを入力:")
	fmt.Scanln(&url)

	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("データ取得エラー:", err)
		return
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("レスポンス・ボディの読み取りエラー:", err)
		return
	}

	fmt.Println("レスポンスボディ:", string(body))
}
