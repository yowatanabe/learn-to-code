package main

import "fmt"

type Employee struct {
	Name         string
	Position     string
	WorkingHours int
	HourlyWage   int
}

func calculateMonthlySalary(employee Employee) int {
	return employee.WorkingHours * employee.HourlyWage
}

func main() {
	employees := make(map[string]Employee)

	for {
		fmt.Println("操作を選んでください:")
		fmt.Println("1. 新しい社員を登録")
		fmt.Println("2. 社員の月給を計算")
		fmt.Println("3. 社員情報を表示")
		fmt.Println("4. 終了")

		var choice int
		fmt.Scanln(&choice)

		switch choice {
		case 1:
			var name, position string
			var workingHours, hourlyWage int

			fmt.Print("社員の名前を入力: ")
			fmt.Scanln(&name)
			fmt.Print("役職を入力: ")
			fmt.Scanln(&position)
			fmt.Print("労働時間を入力: ")
			fmt.Scanln(&workingHours)
			fmt.Print("時給を入力: ")
			fmt.Scanln(&hourlyWage)

			employees[name] = Employee{Name: name, Position: position, WorkingHours: workingHours, HourlyWage: hourlyWage}
			fmt.Println("新しい社員を登録しました")

		case 2:
			fmt.Print("月給を計算したい社員の名前を入力: ")
			var name string
			fmt.Scanln(&name)
			employee, found := employees[name]
			if !found {
				fmt.Println("そのような社員は見つかりません")
				continue
			}
			monthlySalary := calculateMonthlySalary(employee)
			fmt.Printf("%sの月給は%dです\n", name, monthlySalary)

		case 3:
			fmt.Println("社員情報:")
			for _, employee := range employees {
				fmt.Printf("名前: %s, 役職: %s, 労働時間: %d, 時給: %d\n", employee.Name, employee.Position, employee.HourlyWage, employee.HourlyWage)
				fmt.Println("---------------")
			}

		case 4:
			fmt.Println("プログラムを終了します")
			return

		default:
			fmt.Println("無効な操作です")
		}
	}
}
