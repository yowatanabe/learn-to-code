from collections import Counter


def most_frequent_element(nums):
    freq = Counter(nums)
    max_count = max(freq.values())
    for num in nums:
        if freq[num] == max_count:
            return num


# テスト
print(most_frequent_element([1, 3, 1, 3, 2, 1]))  # 1
print(most_frequent_element([4, 4, 2, 2, 3]))  # 4
print(most_frequent_element([5]))  # 5
