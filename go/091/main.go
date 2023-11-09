package main

import "fmt"

type Rectangle struct {
	Width  float64
	Height float64
}

func (r Rectangle) Area() float64 {
	return r.Width * r.Height
}

func (r Rectangle) Perimeter() float64 {
	return 2 * (r.Width + r.Height)
}

func main() {
	rect := Rectangle{Width: 5, Height: 10}

	fmt.Println("長方形の幅:", rect.Width)
	fmt.Println("長方形の高さ:", rect.Height)
	fmt.Println("長方形の面積:", rect.Area())
	fmt.Println("長方形の周囲:", rect.Perimeter())
}
