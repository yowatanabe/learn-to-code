def common_elements(list1, list2):
    return sorted(set(list1) & set(list2))


# テスト
print(common_elements([1, 2, 3], [2, 3, 4]))  # [2, 3]
print(common_elements([5, 5, 5], [5]))  # [5]
print(common_elements([1, 2, 3], [4, 5, 6]))  # []
