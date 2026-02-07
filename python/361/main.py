from typing import List

def merge_intervals(intervals: List[List[int]]) -> List[List[int]]:
    intervals.sort(key=lambda x: x[0])
    merged: List[List[int]] = []

    for s, e in intervals:
        if not merged or merged[-1][1] < s:  # 重ならず、接してもいない
            merged.append([s, e])
        else:
            # 重なる or 接しているので結合
            merged[-1][1] = max(merged[-1][1], e)

    return merged


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[1, 3], [2, 6], [8, 10], [15, 18]], [[1, 6], [8, 10], [15, 18]]),
        ([[1, 4], [4, 5]], [[1, 5]]),
        ([[5, 5], [1, 2], [2, 4]], [[1, 4], [5, 5]]),
    ]

    for i, (intervals, expected) in enumerate(cases, start=1):
        got = merge_intervals(intervals)
        print(f"例{i} 入力: intervals={intervals}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
