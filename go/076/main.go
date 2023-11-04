package main

import "fmt"

type Student struct {
	Name   string
	Age    int
	Grades []int
}

func calcAverage(grades []int) float64 {
	sum := 0

	for _, grade := range grades {
		sum += grade
	}
	return float64(sum) / float64(len(grades))
}

func main() {
	student1 := Student{
		Name:   "生徒A",
		Age:    20,
		Grades: []int{80, 84, 89, 81, 82},
	}

	student2 := Student{
		Name:   "生徒B",
		Age:    19,
		Grades: []int{70, 74, 79, 71, 72},
	}

	students := []Student{student1, student2}

	for _, student := range students {
		fmt.Println("--------------------------------")
		fmt.Printf("名前: %s\n", student.Name)
		fmt.Printf("年齢: %d\n", student.Age)
		fmt.Printf("成績: %v\n", student.Grades)
		average := calcAverage(student.Grades)

		fmt.Printf("成績の平均: %.2f\n", average)
	}
}
