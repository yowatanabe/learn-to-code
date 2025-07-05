from collections import defaultdict


def subarraySum(nums: list[int], k: int) -> int:
    count = 0
    curr_sum = 0
    prefix_sums = defaultdict(int)
    prefix_sums[0] = 1

    for num in nums:
        curr_sum += num
        count += prefix_sums[curr_sum - k]
        prefix_sums[curr_sum] += 1

    return count


# テスト
print(subarraySum([1, 1, 1], 2))  # 出力: 2
print(subarraySum([1, 2, 3], 3))  # 出力: 2
print(subarraySum([1, -1, 0], 0))  # 出力: 3
