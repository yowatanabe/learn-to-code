from typing import List


def next_greater_elements(nums: List[int]) -> List[int]:
    n = len(nums)
    ans = [-1] * n
    stack = []  # インデックスを保持する単調減少スタック（値が降順）

    # 円環を2周ぶん走査（インデックスは i % n）
    for i in range(2 * n):
        cur = nums[i % n]
        # 現在の値が、スタック上位の「次に大きい要素」になれる限り確定させる
        while stack and nums[stack[-1]] < cur:
            j = stack.pop()
            ans[j] = cur
        if i < n:
            # 1周目のみスタックに積む（2周目は確定のための解決のみ）
            stack.append(i)
    return ans


# テスト
print(next_greater_elements([1, 2, 1]))  # [2, -1, 2]
print(next_greater_elements([5, 4, 3, 2, 1]))  # [-1, 5, 5, 5, 5]
print(next_greater_elements([2, 1, 2, 4, 3]))  # [4, 2, 4, -1, 4]
