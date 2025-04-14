package main

import (
	"fmt"
	"strconv"
)

func fizzBuzz(n int) string {
    if n%15 == 0 {
        return "FizzBuzz"
    } else if n%3 == 0 {
        return "Fizz"
    } else if n%5 == 0 {
        return "Buzz"
    }
    return strconv.Itoa(n)
}

func main() {
    fmt.Println(fizzBuzz(15)) // "FizzBuzz"
    fmt.Println(fizzBuzz(9))  // "Fizz"
    fmt.Println(fizzBuzz(10)) // "Buzz"
    fmt.Println(fizzBuzz(7))  // "7"
}
