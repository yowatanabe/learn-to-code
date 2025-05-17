package main

import (
	"fmt"
	"math"
)

func isPrime(n int) bool {
    if n < 2 {
        return false
    }
    for i := 2; i <= int(math.Sqrt(float64(n))); i++ {
        if n%i == 0 {
            return false
        }
    }
    return true
}

func main() {
    fmt.Println(isPrime(2))   // true
    fmt.Println(isPrime(4))   // false
    fmt.Println(isPrime(17))  // true
    fmt.Println(isPrime(1))   // false
}
