package main

import (
	"fmt"
	"time"
)

func sendData(ch chan<- int) {
	for i := 1; i <= 5; i++ {
		ch <- i
		time.Sleep(time.Second)
	}
	close(ch)
}

func main() {
	ch := make(chan int)
	go sendData(ch)

	for {
		v, ok := <-ch
		if ok {
			fmt.Println("受信", v)
		} else {
			fmt.Println("チャネル クローズ")
			break
		}
	}
}
