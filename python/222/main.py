from typing import List


def find_length_of_lcis(nums: List[int]) -> int:
    """
    最長連続増加部分列の長さを求める。
    一度走査し、現在の増加部分列の長さをカウント。
    """
    if not nums:
        return 0

    max_len = 1
    cur_len = 1

    for i in range(1, len(nums)):
        if nums[i] > nums[i - 1]:
            cur_len += 1
            max_len = max(max_len, cur_len)
        else:
            cur_len = 1  # 増加が途切れたらリセット

    return max_len


# テスト
print(find_length_of_lcis([1, 3, 5, 4, 7]))  # 3
print(find_length_of_lcis([2, 2, 2, 2, 2]))  # 1
print(find_length_of_lcis([10, 20, 30, 5, 10, 50]))  # 3
