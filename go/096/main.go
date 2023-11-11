package main

import (
	"fmt"
	"math/rand"
	"time"
)

type Metrics struct {
	CPU    float64
	Memory float64
}

type Alert struct {
	Message    string
	LastUpdate time.Time
}

func main() {
	metrics := Metrics{}
	alert := Alert{}

	for {
		updateMetrics(&metrics)
		checkThresholds(&metrics, &alert)
		time.Sleep(5 * time.Second)
	}
}

func updateMetrics(metrics *Metrics) {
	// 動作確認用にダミーデータ取得
	metrics.CPU = randomUsage()
	metrics.Memory = randomUsage()
}

func checkThresholds(metrics *Metrics, alert *Alert) {
	cpuThreshold := 80.0
	memoryThreshold := 80.0

	if metrics.CPU > cpuThreshold && alert.Message == "" {
		alert.Message = fmt.Sprintf("CPU使用率が%.2f%%を超えました", metrics.CPU)
		alert.LastUpdate = time.Now()
		fmt.Println(alert.Message)
	}

	if metrics.Memory > memoryThreshold && alert.Message == "" {
		alert.Message = fmt.Sprintf("メモリ使用率が%.2f%%を超えました", metrics.Memory)
		alert.LastUpdate = time.Now()
		fmt.Println(alert.Message)
	}

	// 閾値を下回るまでを擬似的に再現
	if time.Since(alert.LastUpdate) > 10*time.Second {
		alert.Message = ""
	}
}

// 動作確認用にダミーデータを生成
func randomUsage() float64 {
	return float64(randomInt(70, 99))
}

func randomInt(min, max int) int {
	return min + rand.Intn(max-min+1)
}
