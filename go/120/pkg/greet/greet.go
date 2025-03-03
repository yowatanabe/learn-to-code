package greet

import "fmt"

// Greet は指定した名前と言語で挨拶を生成する
func Greet(name, lang string) string {
    switch lang {
    case "ja":
        return fmt.Sprintf("こんにちは、%sさん！", name)
    case "es":
        return fmt.Sprintf("¡Hola, %s!", name)
    default:
        return fmt.Sprintf("Hello, %s!", name)
    }
}
