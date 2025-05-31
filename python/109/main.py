def remove_duplicates(nums):
    seen = set()
    result = []
    for num in nums:
        if num not in seen:
            seen.add(num)
            result.append(num)
    return result


# テスト
print(remove_duplicates([1, 2, 2, 3, 1]))  # [1, 2, 3]
print(remove_duplicates([4, 5, 4, 4, 6]))  # [4, 5, 6]
print(remove_duplicates([]))  # []
