package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("ファイルパスを指定してください。")
		return
	}

	filepath := os.Args[1]

	file, err := os.Open(filepath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	sum := 0
	count := 0

	for scanner.Scan() {
		num, err := strconv.Atoi(scanner.Text())
		if err != nil {
			log.Printf("無効な数値: %v", scanner.Text())
			continue
		}
		if num <= 0 {
			log.Printf("無効な数値: %d", num)
			continue
		}
		sum += num
		count++
	}

	if count == 0 {
		fmt.Println("有効な数値が見つかりませんでした。")
	} else {
		average := float64(sum) / float64(count)
		fmt.Printf("有効な数値の平均値: %.2f\n", average)
	}
}
