package main

import (
	"fmt"
	"sort"
)

func countCharacters(s string) map[rune]int {
    count := make(map[rune]int)
    for _, ch := range s {
        count[ch]++
    }
    return count
}

func printCharacterCount(count map[rune]int) {
    // 表示順を整えるため、キーをスライスに集めてソート
    keys := make([]rune, 0, len(count))
    for ch := range count {
        keys = append(keys, ch)
    }
    sort.Slice(keys, func(i, j int) bool { return keys[i] < keys[j] })

    fmt.Print("map[")
    for i, ch := range keys {
        fmt.Printf("%c:%d", ch, count[ch])
        if i != len(keys)-1 {
            fmt.Print(" ")
        }
    }
    fmt.Println("]")
}

func main() {
    printCharacterCount(countCharacters("aabbc"))   // map[a:2 b:2 c:1]
    printCharacterCount(countCharacters("abcabc")) // map[a:2 b:2 c:2]
    printCharacterCount(countCharacters(""))       // map[]
}
