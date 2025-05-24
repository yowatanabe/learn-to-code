def common_elements(list1, list2):
    return list(set(list1) & set(list2))


# テスト
print(common_elements([1, 2, 3], [2, 3, 4]))  # [2, 3]（順序は問わない）
print(common_elements([5, 6, 7], [7, 8, 9]))  # [7]
print(common_elements([1, 2], [3, 4]))  # []
