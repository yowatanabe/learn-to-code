package main

import (
	"fmt"
	"os"
	"path/filepath"
)

func visit(path string, info os.FileInfo, err error) error {
	if err != nil {
		return err
	}

	fmt.Printf("ファイル名: %s, サイズ: %d\n", path, info.Size())
	return nil
}

func main() {
	root := "files/"

	err := filepath.Walk(root, visit)
	if err != nil {
		fmt.Printf("エラー: %v\n", err)
	}
}
