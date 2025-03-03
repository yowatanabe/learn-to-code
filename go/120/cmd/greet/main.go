package main

import (
	"flag"
	"fmt"
	"myproject/pkg/greet"
)

func main() {
    name := flag.String("name", "World", "挨拶する名前を指定")
    lang := flag.String("lang", "en", "使用する言語 (en, ja, es)")
    flag.Parse()

    fmt.Println(greet.Greet(*name, *lang))
}
