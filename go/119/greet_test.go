package main

import (
	"flag"
	"fmt"
	"os"
	"testing"
)

func TestGreet(t *testing.T) {
    tests := []struct {
        args     []string
        expected string
    }{
        {[]string{"-name=Alice", "-lang=en"}, "Hello, Alice!"},
        {[]string{"-name=Taro", "-lang=ja"}, "こんにちは、Taroさん！"},
        {[]string{"-name=Pedro", "-lang=es"}, "¡Hola, Pedro!"},
    }

    for _, tt := range tests {
        flag.CommandLine = flag.NewFlagSet(os.Args[0], flag.ExitOnError)
        name := flag.String("name", "World", "挨拶する名前を指定")
        lang := flag.String("lang", "en", "使用する言語 (en, ja, es)")
        flag.CommandLine.Parse(tt.args)

        var greeting string
        switch *lang {
        case "ja":
            greeting = fmt.Sprintf("こんにちは、%sさん！", *name)
        case "es":
            greeting = fmt.Sprintf("¡Hola, %s!", *name)
        default:
            greeting = fmt.Sprintf("Hello, %s!", *name)
        }

        if greeting != tt.expected {
            t.Errorf("got %q, want %q", greeting, tt.expected)
        }
    }
}
