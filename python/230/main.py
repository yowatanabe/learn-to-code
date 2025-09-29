from typing import List


def daily_temperatures(temperatures: List[int]) -> List[int]:
    """
    単調減少スタック（インデックスを保持）で O(n) 解。
    スタック上は「まだ次に高い気温が見つかっていない日」を
    気温が降順になるように積む。
    現在日の気温がスタック頂点より高ければ、答えを確定してポップ。
    """
    n = len(temperatures)
    ans = [0] * n
    stack = []  # 各日のインデックスを保持。temperatures[stack] は降順。

    for i, t in enumerate(temperatures):
        while stack and temperatures[stack[-1]] < t:
            j = stack.pop()
            ans[j] = i - j
        stack.append(i)

    return ans


# テスト
print(daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]))  # [1,1,4,2,1,1,0,0]
print(daily_temperatures([30, 40, 50, 60]))  # [1,1,1,0]
print(daily_temperatures([30, 60, 90]))  # [1,1,0]
print(daily_temperatures([80, 79, 78]))  # [0,0,0]
