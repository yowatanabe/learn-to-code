package main

import (
	"bufio"
	"fmt"
	"os"
)

// CountLines は指定されたファイルの行数をカウントする
func CountLines(filename string) (int, error) {
    file, err := os.Open(filename)
    if err != nil {
        return 0, err
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    lineCount := 0
    for scanner.Scan() {
        lineCount++
    }

    if err := scanner.Err(); err != nil {
        return 0, err
    }
    return lineCount, nil
}

func main() {
    if len(os.Args) < 2 {
        fmt.Println("使用法: go run linecount.go <ファイル名>")
        os.Exit(1)
    }

    filename := os.Args[1]
    count, err := CountLines(filename)
    if err != nil {
        fmt.Printf("エラー: %v\n", err)
        os.Exit(1)
    }

    fmt.Printf("ファイル '%s' の行数: %d\n", filename, count)
}
