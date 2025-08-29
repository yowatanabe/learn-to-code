from collections import defaultdict
from typing import List


def subarrays_div_by_k(nums: List[int], k: int) -> int:
    # prefix_sum の剰余が同じペアの数を数える
    cnt = defaultdict(int)
    cnt[0] = 1  # 空の prefix（部分配列の開始前）を1つカウント
    total = 0
    prefix = 0

    for x in nums:
        prefix += x
        # Pythonの % は常に非負なので、そのままでOK（他言語では正規化が必要なことも）
        r = prefix % k
        total += cnt[r]  # 以前に同じ剰余が現れた回数だけ新しい部分配列ができる
        cnt[r] += 1

    return total


# テスト
print(subarrays_div_by_k([4, 5, 0, -2, -3, 1], 5))  # 7
print(subarrays_div_by_k([1, 2, 3, 4, 5], 3))  # 7
print(subarrays_div_by_k([-1, 2, 9], 2))  # 2
print(subarrays_div_by_k([1, 2], 1))  # 3
