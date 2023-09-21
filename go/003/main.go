package main

import "fmt"

func main() {
    var age int = 30
    var name string = "User"
    scores := [...]int{98, 87, 76, 92, 88}

    fmt.Printf("Age: %d\n", age)
    fmt.Printf("Name: %s\n", name)
    fmt.Printf("Scores: %v\n", scores)
}
