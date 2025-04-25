package main

import (
	"fmt"
	"strings"
)

func toLowerCaseString(s string) string {
    return strings.ToLower(s)
}

func main() {
    fmt.Println(toLowerCaseString("HelloWorld"))   // "helloworld"
    fmt.Println(toLowerCaseString("GoLang123!"))   // "golang123!"
    fmt.Println(toLowerCaseString("alreadylower")) // "alreadylower"
}
