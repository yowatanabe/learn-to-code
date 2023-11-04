package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"sync"
)

func walkDir(dir string) {
	files, err := ioutil.ReadDir(dir)
	if err != nil {
		panic(err)
	}

	var wg sync.WaitGroup

	for _, f := range files {
		wg.Add(1)
		go func(file os.FileInfo) {
			defer wg.Done()

			fullpath := filepath.Join(dir, file.Name())
			if file.IsDir() {
				fmt.Println("DIR:", fullpath)
			} else {
				fmt.Println("FILE:", fullpath)
			}
		}(f)
	}

	wg.Wait()
}

func main() {
	dir := "./data"
	walkDir(dir)
}
