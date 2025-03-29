package main

import (
	"fmt"
)

func evenOrOdd(n int) string {
    if n%2 == 0 {
        return "even"
    }
    return "odd"
}

func main() {
    fmt.Println(evenOrOdd(4))  // even
    fmt.Println(evenOrOdd(7))  // odd
    fmt.Println(evenOrOdd(0))  // even
}
