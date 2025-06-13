from collections import Counter


def sum_of_unique(nums):
    count = Counter(nums)
    return sum(num for num, freq in count.items() if freq == 1)


# テスト
print(sum_of_unique([1, 2, 2, 3, 4, 4]))  # 出力: 4
print(sum_of_unique([5, 5, 5, 5]))  # 出力: 0
print(sum_of_unique([10, 20, 10, 30, 40]))  # 出力: 90
