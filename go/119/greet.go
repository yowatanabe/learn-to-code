package main

import (
	"flag"
	"fmt"
)

func main() {
    // コマンドライン引数の定義
    name := flag.String("name", "World", "挨拶する名前を指定")
    lang := flag.String("lang", "en", "使用する言語 (en, ja, es)")
    flag.Parse()

    // 挨拶文の設定
    var greeting string
    switch *lang {
    case "ja":
        greeting = fmt.Sprintf("こんにちは、%sさん！", *name)
    case "es":
        greeting = fmt.Sprintf("¡Hola, %s!", *name)
    default:
        greeting = fmt.Sprintf("Hello, %s!", *name)
    }

    fmt.Println(greeting)
}
