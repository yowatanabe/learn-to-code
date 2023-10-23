package main

import "fmt"

type Employee struct {
	Name     string
	Age      int
	Salary   int
	Language []string
}

func main() {
	employees := []Employee{
		{Name: "従業員A", Age: 20, Salary: 300, Language: []string{"Go", "Python", "Java"}},
		{Name: "従業員B", Age: 30, Salary: 400, Language: []string{"Go", "C++"}},
		{Name: "従業員C", Age: 40, Salary: 500, Language: []string{"Python", "Ruby"}},
	}

	languageCount := make(map[string]int)
	for _, emp := range employees {
		for _, lang := range emp.Language {
			languageCount[lang]++
		}
	}

	for lang, count := range languageCount {
		fmt.Printf("%s: 従業員%d名が使用しています\n", lang, count)
	}
}
