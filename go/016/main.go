package main

import (
	"fmt"
)

type Student struct {
	ID     int
	Name   string
	Grades map[string]int
}

func NewStudent(id int, name string) *Student {
	student := &Student{
		ID:     id,
		Name:   name,
		Grades: make(map[string]int),
	}
	return student
}

func (s *Student) AddGrade(subject string, grade int) {
	s.Grades[subject] = grade
}

func (s *Student) UpdateGrade(subject string, grade int) {
	s.Grades[subject] = grade
}

func (s *Student) DeleteGrade(subject string) {
	delete(s.Grades, subject)
}

func (s *Student) CalculateAverage() float64 {
	total := 0
	count := 0
	for _, grade := range s.Grades {
		total += grade
		count++
	}
	if count == 0 {
		return 0.0
	}
	return float64(total) / float64(count)
}

func (s *Student) GetMaxMinGrades() (int, int) {
	maxGrade := -1
	minGrade := 101
	for _, grade := range s.Grades {
		if grade > maxGrade {
			maxGrade = grade
		}
		if grade < minGrade {
			minGrade = grade
		}
	}
	return maxGrade, minGrade
}

func (s *Student) DisplayStudentInfo() {
	fmt.Printf("Student ID: %d\n", s.ID)
	fmt.Printf("Name: %s\n", s.Name)
	fmt.Println("Grades:")
	for subject, grade := range s.Grades {
		fmt.Printf("%s: %d\n", subject, grade)
	}
}

func main() {
	student := NewStudent(1, "Alice")
	student.AddGrade("Math", 90)
	student.AddGrade("Science", 85)
	student.AddGrade("History", 88)

	fmt.Println("Student Information:")
	student.DisplayStudentInfo()

	average := student.CalculateAverage()
	fmt.Printf("Average Grade: %.2f\n", average)

	maxGrade, minGrade := student.GetMaxMinGrades()
	fmt.Printf("Max Grade: %d\n", maxGrade)
	fmt.Printf("Min Grade: %d\n", minGrade)
}
