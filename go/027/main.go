package main

import "fmt"

type Student struct {
	Name   string
	Scores map[string]int
}

const (
	PassScore = 60
)

func calculateTotalAndAverage(scores map[string]int) (int, float64) {
	total := 0
	for _, score := range scores {
		total += score
	}
	average := float64(total) / float64(len(scores))
	return total, average
}

func main() {
	students := make(map[string]Student)

	for {
		fmt.Println("操作を選んでください:")
		fmt.Println("1. 新しい学生を登録")
		fmt.Println("2. 学生の成績を表示")
		fmt.Println("3. 終了")

		var choice int
		fmt.Scanln(&choice)

		switch choice {
		case 1:
			var name string
			fmt.Print("学生の名前を入力: ")
			fmt.Scanln(&name)

			scores := make(map[string]int)
			var subjectCount int
			fmt.Print("科目数を入力: ")
			fmt.Scanln(&subjectCount)

			for i := 0; i < subjectCount; i++ {
				var subject string
				var score int
				fmt.Print("科目名を入力: ")
				fmt.Scanln(&subject)
				fmt.Print("スコアを入力: ")
				fmt.Scanln(&score)
				scores[subject] = score
			}

			students[name] = Student{Name: name, Scores: scores}
			fmt.Println("新しい学生を登録しました")

		case 2:
			fmt.Print("成績を表示したい学生の名前を入力: ")
			var name string
			fmt.Scanln(&name)
			student, found := students[name]
			if !found {
				fmt.Println("そのような学生は見つかりません")
				continue
			}
			fmt.Printf("名前: %s\n", student.Name)
			for subject, score := range student.Scores {
				fmt.Printf("%s: %d\n", subject, score)
			}
			total, average := calculateTotalAndAverage(student.Scores)
			fmt.Printf("合計スコア: %d, 平均スコア: %.2f\n", total, average)

		case 3:
			fmt.Println("プログラムを終了します")
			return

		default:
			fmt.Println("無効な操作です")
		}
	}
}
