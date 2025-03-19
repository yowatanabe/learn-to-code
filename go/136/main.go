package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, Dockerized Go App!")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("サーバーをポート 8080 で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
