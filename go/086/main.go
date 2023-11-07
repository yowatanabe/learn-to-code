package main

import "fmt"

func removeDuplicateNums(nums []int) []int {
	x := map[int]bool{}
	result := []int{}

	for v := range nums {
		if x[nums[v]] != true {
			x[nums[v]] = true
			result = append(result, nums[v])
		}
	}

	return result
}

func main() {
	nums := []int{1, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 10}
	uniqueNums := removeDuplicateNums(nums)
	fmt.Println("重複削除後のリスト:", uniqueNums)
}
