from functools import lru_cache


def longest_alternating_merge(a, b):
    n, m = len(a), len(b)

    @lru_cache(None)
    def dp(i, j, last):
        # i: a の現在位置
        # j: b の現在位置
        # last: 直前に使った文字（まだ何も使っていないときは ""）
        best = 0

        # a 側から次に使える文字を探す
        for ni in range(i, n):
            if a[ni] != last:
                best = max(best, 1 + dp(ni + 1, j, a[ni]))

        # b 側から次に使える文字を探す
        for nj in range(j, m):
            if b[nj] != last:
                best = max(best, 1 + dp(i, nj + 1, b[nj]))

        return best

    return dp(0, 0, "")


# 実行例
a1 = "ab"
b1 = "bc"

a2 = "aa"
b2 = "bb"

a3 = "aaa"
b3 = "a"

print(longest_alternating_merge(a1, b1))  # 4
print(longest_alternating_merge(a2, b2))  # 4
print(longest_alternating_merge(a3, b3))  # 1
