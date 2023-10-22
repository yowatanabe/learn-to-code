package main

import "fmt"

type Student struct {
	Name   string
	Age    int
	Grades []int
}

func checkPassingGrades(grades []int) bool {
	for _, grade := range grades {
		if grade < 40 {
			return false
		}
	}
	return true
}

func main() {
	students := []Student{
		{Name: "生徒A", Age: 20, Grades: []int{62, 72, 68}},
		{Name: "生徒B", Age: 19, Grades: []int{39, 62, 45}},
		{Name: "生徒C", Age: 21, Grades: []int{81, 79, 80}},
	}

	passingGrades := make(map[string]bool)
	for _, student := range students {
		passingGrades[student.Name] = checkPassingGrades(student.Grades)
	}

	for _, student := range students {
		fmt.Printf("Name: %s, Age: %d\n", student.Name, student.Age)
		fmt.Printf("Grades: %v\n", student.Grades)
		if passingGrades[student.Name] {
			fmt.Println("結果: 合格")
		} else {
			fmt.Println("結果: 失格")
		}
	}
}
