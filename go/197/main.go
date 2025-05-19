package main

import (
	"fmt"
)

func isOneCharDifferent(s string, t string) bool {
    if len(s) != len(t) {
        return false
    }

    diff := 0
    for i := 0; i < len(s); i++ {
        if s[i] != t[i] {
            diff++
            if diff > 1 {
                return false
            }
        }
    }
    return diff == 1
}

func main() {
    fmt.Println(isOneCharDifferent("abcd", "abed")) // true
    fmt.Println(isOneCharDifferent("abc", "abc"))   // false
    fmt.Println(isOneCharDifferent("abc", "def"))   // false
}
