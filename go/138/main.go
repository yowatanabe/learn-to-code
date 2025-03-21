package main

import (
	"fmt"
	"strings"
)

// 各単語を反転する関数
func reverseWords(s string) string {
    words := strings.Split(s, " ") // スペース区切りで分割
    for i, word := range words {
        words[i] = reverseString(word)
    }
    return strings.Join(words, " ") // 元のスペースを保持したまま結合
}

// 文字列を反転するヘルパー関数
func reverseString(s string) string {
    runes := []rune(s)
    left, right := 0, len(runes)-1
    for left < right {
        runes[left], runes[right] = runes[right], runes[left]
        left++
        right--
    }
    return string(runes)
}

func main() {
    fmt.Println(reverseWords("hello world"))  // "olleh dlrow"
    fmt.Println(reverseWords("Go is fun"))    // "oG si nuf"
    fmt.Println(reverseWords("  a b   c  "))  // "  a b   c  "
}
