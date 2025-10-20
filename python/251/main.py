from typing import List


def longest_uptime_with_k_tolerated_failures(health: List[int], K: int) -> int:
    """
    0/1配列 health で、0 を最大 K 個まで 1 とみなすときの
    連続区間の最長長を O(n) で返す。
    """
    n = len(health)
    l = 0
    zeros = 0
    best = 0

    for r, x in enumerate(health):
        if x == 0:
            zeros += 1
        # 許容失敗回数を超えたら左端を縮める
        while zeros > K:
            if health[l] == 0:
                zeros -= 1
            l += 1
        # 現在の有効窓 [l..r] の長さで更新
        best = max(best, r - l + 1)

    return best


print(longest_uptime_with_k_tolerated_failures([1, 0, 1, 1, 0, 1], 1))
print(longest_uptime_with_k_tolerated_failures([0, 0, 0], 2))
print(longest_uptime_with_k_tolerated_failures([1, 1, 1], 0))
print(longest_uptime_with_k_tolerated_failures([], 4))
