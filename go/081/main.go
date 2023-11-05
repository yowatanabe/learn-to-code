package main

import (
	"fmt"
	"io"
	"os"
)

func copyFile(src, dst string) error {
	source, err := os.Open(src)
	if err != nil {
		return err
	}
	defer source.Close()

	destination, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer destination.Close()

	_, err = io.Copy(destination, source)
	if err != nil {
		return err
	}

	return nil
}

func main() {
	sourceFilePath := "./files/src.txt"
	destinationFilePath := "./files/dst.txt"

	err := copyFile(sourceFilePath, destinationFilePath)
	if err != nil {
		fmt.Println("エラー:", err)
	} else {
		fmt.Println("ファイルのコピーに成功しました。")
	}
}
