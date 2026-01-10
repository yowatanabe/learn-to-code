from typing import List


def daily_temperatures(temperatures: List[int]) -> List[int]:
    n = len(temperatures)
    ans = [0] * n
    stack = []  # インデックスを保持（temperatures[stack] は単調減少）

    for i, t in enumerate(temperatures):
        while stack and temperatures[stack[-1]] < t:
            j = stack.pop()
            ans[j] = i - j
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

    for i, temperatures in enumerate(cases, start=1):
        print(f"例{i} 入力: {temperatures}")
        print(f"例{i} 出力: {daily_temperatures(temperatures)}")
        print("-" * 50)
