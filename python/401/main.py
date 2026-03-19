from typing import List

def next_greater_elements(nums: List[int]) -> List[int]:
    """
    単調スタックを使う典型問題。

    スタックには「まだ次に大きい値が見つかっていない要素のインデックス」を入れる。
    現在の値 nums[i] が、スタックの先頭要素より大きければ、
    その要素の答えは nums[i] に確定する。

    計算量: O(n)
    """
    n = len(nums)
    answer = [-1] * n
    stack = []  # インデックスを入れる。対応する値は単調減少になる

    for i, value in enumerate(nums):
        while stack and nums[stack[-1]] < value:
            prev_index = stack.pop()
            answer[prev_index] = value
        stack.append(i)

    return answer


if __name__ == "__main__":
    print(next_greater_elements([2, 1, 2, 4, 3]))  # [4, 2, 4, -1, -1]
    print(next_greater_elements([1, 2, 3, 4]))     # [2, 3, 4, -1]
    print(next_greater_elements([4, 3, 2, 1]))     # [-1, -1, -1, -1]
