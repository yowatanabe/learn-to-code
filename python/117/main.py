def has_common_element(nums1, nums2):
    return bool(set(nums1) & set(nums2))


# テスト
print(has_common_element([1, 2, 3], [3, 4, 5]))  # True
print(has_common_element([1, 2, 3], [4, 5, 6]))  # False
print(has_common_element([], [1]))  # False
