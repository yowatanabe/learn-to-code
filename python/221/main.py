from typing import List


def coin_change(coins: List[int], amount: int) -> int:
    """
    DP: dp[x] = 金額xを作る最小枚数（作れない場合は∞相当）
    遷移: dp[x] = min(dp[x], dp[x - c] + 1) for c in coins if x >= c
    計算量: O(amount * len(coins)), 追加メモリ: O(amount)
    """
    INF = amount + 1  # 上限（amountを1円玉だけで作るより大きければ∞扱い）
    dp = [INF] * (amount + 1)
    dp[0] = 0

    for c in coins:
        for x in range(c, amount + 1):
            if dp[x - c] + 1 < dp[x]:
                dp[x] = dp[x - c] + 1

    return -1 if dp[amount] == INF else dp[amount]


# テスト
print(coin_change([1, 2, 5], 11))  # 3
print(coin_change([2], 3))  # -1
print(coin_change([1], 0))  # 0
print(coin_change([2, 5, 10, 1], 27))  # 4
