package main

import (
	"testing"
	"time"
)

// TestTicker 短時間のTicker動作を確認
func TestTicker(t *testing.T) {
    ticker := time.NewTicker(100 * time.Millisecond)
    defer ticker.Stop()

    timeout := time.After(500 * time.Millisecond) // 500msでタイムアウト
    count := 0

    for {
        select {
        case <-ticker.C:
            count++
        case <-timeout:
            if count < 3 {
                t.Errorf("Expected at least 3 ticks, but got %d", count)
            }
            return
        }
    }
}
