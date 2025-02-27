package main

import (
	"io/ioutil"
	"os"
	"testing"
)

func TestCountLines(t *testing.T) {
    // 一時ファイルを作成
    tmpFile, err := ioutil.TempFile("", "testfile*.txt")
    if err != nil {
        t.Fatal(err)
    }
    defer os.Remove(tmpFile.Name()) // テスト後に削除

    content := "Line 1\nLine 2\nLine 3\n"
    if _, err := tmpFile.WriteString(content); err != nil {
        t.Fatal(err)
    }
    tmpFile.Close()

    // CountLines 関数をテスト
    got, err := CountLines(tmpFile.Name())
    if err != nil {
        t.Fatalf("CountLines() エラー: %v", err)
    }

    want := 3
    if got != want {
        t.Errorf("CountLines() = %d, want %d", got, want)
    }
}
