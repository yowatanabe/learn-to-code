package greet

import "testing"

func TestGreet(t *testing.T) {
    tests := []struct {
        name, lang, want string
    }{
        {"Alice", "en", "Hello, Alice!"},
        {"Taro", "ja", "こんにちは、Taroさん！"},
        {"Pedro", "es", "¡Hola, Pedro!"},
    }

    for _, tt := range tests {
        got := Greet(tt.name, tt.lang)
        if got != tt.want {
            t.Errorf("Greet(%q, %q) = %q; want %q", tt.name, tt.lang, got, tt.want)
        }
    }
}
