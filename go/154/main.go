package main

import (
	"fmt"
)

func countVowels(s string) int {
    vowels := map[rune]bool{
        'a': true, 'e': true, 'i': true, 'o': true, 'u': true,
    }

    count := 0
    for _, ch := range s {
        if vowels[ch] {
            count++
        }
    }
    return count
}

func main() {
    fmt.Println(countVowels("hello"))   // 2
    fmt.Println(countVowels("golang"))  // 2
    fmt.Println(countVowels("rhythm"))  // 0
}
