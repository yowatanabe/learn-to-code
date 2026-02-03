from typing import List


def daily_temperatures(temps: List[int]) -> List[int]:
    n = len(temps)
    ans = [0] * n
    stack = []  # インデックスを保持（temps は単調減少になる）

    for i, t in enumerate(temps):
        while stack and temps[stack[-1]] < t:
            j = stack.pop()
            ans[j] = i - j
        stack.append(i)

    return ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([73, 74, 75, 71, 69, 72, 76, 73], [1, 1, 4, 2, 1, 1, 0, 0]),
        ([30, 40, 50, 60], [1, 1, 1, 0]),
        ([60, 50, 40, 30], [0, 0, 0, 0]),
    ]

    for i, (temps, expected) in enumerate(cases, start=1):
        got = daily_temperatures(temps)
        print(f"例{i} 入力: temps={temps}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
