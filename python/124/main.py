def common_elements(nums1, nums2):
    return sorted(list(set(nums1) & set(nums2)))


# テスト
print(common_elements([1, 2, 2, 3], [2, 3, 4]))  # 出力: [2, 3]
print(common_elements([5, 6, 7], [8, 9, 10]))  # 出力: []
print(common_elements([1, 1, 1, 2], [1, 2, 2]))  # 出力: [1, 2]
