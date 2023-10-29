package main

import "fmt"

func sender(ch chan int, start int) {
	for i := start; i < start+10; i++ {
		ch <- i
	}
	close(ch)
}

func main() {
	ch1 := make(chan int)
	ch2 := make(chan int)
	ch3 := make(chan int)

	go sender(ch1, 1)
	go sender(ch2, 11)
	go sender(ch3, 21)

	for v := range ch1 {
		fmt.Println(v)
	}

	for v := range ch2 {
		fmt.Println(v)
	}

	for v := range ch3 {
		fmt.Println(v)
	}
}
