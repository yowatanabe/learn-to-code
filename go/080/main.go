package main

import "fmt"

const PassScore = 70

type Student struct {
	ID    int
	Name  string
	Score int
}

func showStudentInfo(s *Student) {
	result := "不合格"
	if s.Score >= PassScore {
		result = "合格"
	}
	fmt.Printf("生徒ID: %d, 生徒名: %s, 得点: %d, 合否判定: %s\n", s.ID, s.Name, s.Score, result)
}

func main() {
	students := []Student{
		{ID: 1, Name: "生徒A", Score: 75},
		{ID: 2, Name: "生徒B", Score: 80},
		{ID: 3, Name: "生徒C", Score: 65},
	}

	for _, s := range students {
		showStudentInfo(&s)
	}
}
