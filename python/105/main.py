def have_same_elements(list1, list2):
    return set(list1) == set(list2)


# テスト
print(have_same_elements([1, 2, 2, 3], [3, 2, 1]))  # True
print(have_same_elements([1, 2, 3], [1, 2, 4]))  # False
print(have_same_elements([], []))  # True
