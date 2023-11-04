package main

import (
	"bufio"
	"fmt"
	"net/http"
	"os"
	"time"
)

func main() {
	start := time.Now()

	// 確認対象のAPIのリストを読み込む
	file, err := os.Open("apis.txt")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	var apis []string

	for scanner.Scan() {
		apis = append(apis, scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		fmt.Println(err)
		return
	}

	// 処理実行
	ch := make(chan string)

	for _, api := range apis {
		go checkAPI(api, ch)
	}

	for i := 0; i < len(apis); i++ {
		fmt.Print(<-ch)
	}

	elapsed := time.Since(start)
	fmt.Printf("完了! 処理には%v秒かかりました!\n", elapsed.Seconds())
}

func checkAPI(api string, ch chan string) {
	_, err := http.Get(api)
	if err != nil {
		ch <- fmt.Sprintf("失敗: %s の応答がありません!\n", api)
		return
	}

	ch <- fmt.Sprintf("成功: %s の応答があります!\n", api)
}
