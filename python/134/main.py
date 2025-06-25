def common_elements(list1, list2):
    # 集合に変換して重複を排除し、共通部分をとる
    return sorted(list(set(list1) & set(list2)))


# テスト
print(common_elements([1, 2, 2, 3], [2, 3, 4]))  # 出力: [2, 3]
print(common_elements([4, 5, 6], [7, 8, 9]))  # 出力: []
print(common_elements([], [1, 2]))  # 出力: []
