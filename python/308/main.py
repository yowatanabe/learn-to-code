from typing import List


def daily_temperatures(temperatures: List[int]) -> List[int]:
    """
    次に気温が上がるまでの日数を返す。
    単調スタックで O(n)。
    """
    n = len(temperatures)
    ans = [0] * n
    stack = []  # インデックスを保持（temperatures[stack] は降順になる）

    for i, t in enumerate(temperatures):
        # 今日の気温 t が、過去の未解決日の気温より高いなら解決できる
        while stack and temperatures[stack[-1]] < t:
            prev = stack.pop()
            ans[prev] = i - prev
        stack.append(i)

    return ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        [73, 74, 75, 71, 69, 72, 76, 73],
        [30, 40, 50, 60],
        [30, 60, 90],
    ]

    for idx, temperatures in enumerate(cases, start=1):
        print("-" * 40)
        print(f"例{idx} 入力: {temperatures}")
        print(f"例{idx} 出力: {daily_temperatures(temperatures)}")
