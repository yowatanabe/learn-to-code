package main

import "fmt"

type Rectangle struct {
	Length float64
	Width  float64
}

func calcArea(rect *Rectangle) float64 {
	return rect.Length * rect.Width
}

func main() {
	rect := Rectangle{Length: 5.0, Width: 3.0}

	area := calcArea(&rect)
	fmt.Printf("面積は%.1fです。\n", area)

	if area > 10 {
		fmt.Println("面積は10より大きいです。")
	} else {
		fmt.Println("面積は10より小さいです。")
	}
}
