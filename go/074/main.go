package main

import (
	"fmt"
	"image"
	"image/png"
	"os"
	"sync"
)

func processImage(img image.Image) {
	var wg sync.WaitGroup
	bounds := img.Bounds()

	for y := bounds.Min.Y; y < bounds.Max.Y; y++ {
		wg.Add(1)

		go func(y int) {
			defer wg.Done()
			for x := bounds.Min.X; x < bounds.Max.X; x++ {
				r, g, b, _ := img.At(x, y).RGBA()
				fmt.Printf("(%d, %d) RGB: (%d, %d, %d)\n", x, y, r, g, b)
			}
		}(y)
	}

	wg.Wait()
}

func main() {
	f, err := os.Open("sample.png")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	img, err := png.Decode(f)
	if err != nil {
		panic(err)
	}

	processImage(img)
}
