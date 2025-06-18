def common_elements(list1, list2):
    return sorted(set(list1) & set(list2))


# テスト
print(common_elements([1, 2, 2, 3], [2, 3, 4]))  # 出力: [2, 3]
print(common_elements([5, 6, 7], [1, 2, 3]))  # 出力: []
print(common_elements([1, 2, 3], [3, 2, 1]))  # 出力: [1, 2, 3]
