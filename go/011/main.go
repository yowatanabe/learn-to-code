package main

import (
	"fmt"
)

func main() {
	for {
		var num int
		fmt.Print("整数を入力してください (0で終了): ")
		fmt.Scan(&num)

		if num == 0 {
			fmt.Println("プログラムを終了します。")
			break
		}

		if num%2 == 0 {
			fmt.Println("偶数です。")
		} else {
			fmt.Println("奇数です。")
		}
	}
}
