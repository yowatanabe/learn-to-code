package main

import (
	"fmt"
	"strconv"
)

func fizzBuzzValue(n int) string {
    if n%3 == 0 && n%5 == 0 {
        return "FizzBuzz"
    } else if n%3 == 0 {
        return "Fizz"
    } else if n%5 == 0 {
        return "Buzz"
    } else {
        return strconv.Itoa(n)
    }
}

func main() {
    fmt.Println(fizzBuzzValue(15)) // "FizzBuzz"
    fmt.Println(fizzBuzzValue(9))  // "Fizz"
    fmt.Println(fizzBuzzValue(10)) // "Buzz"
    fmt.Println(fizzBuzzValue(7))  // "7"
}
