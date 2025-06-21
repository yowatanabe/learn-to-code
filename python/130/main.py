def remove_duplicates_and_sort(nums):
    return sorted(set(nums))


# テスト
print(remove_duplicates_and_sort([3, 1, 2, 3]))  # 出力: [1, 2, 3]
print(remove_duplicates_and_sort([5, 5, 5, 5]))  # 出力: [5]
print(remove_duplicates_and_sort([]))  # 出力: []
