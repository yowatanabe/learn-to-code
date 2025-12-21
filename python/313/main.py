from typing import List


def merge_intervals(intervals: List[List[int]]) -> List[List[int]]:
    """
    重なり合う区間をマージして返す。
    端点が接している場合もマージ（next_start <= current_end）。
    """
    if not intervals:
        return []

    # start 昇順でソート
    intervals.sort(key=lambda x: x[0])

    merged = [intervals[0]]

    for start, end in intervals[1:]:
        last_start, last_end = merged[-1]

        if start <= last_end:
            # 重なる/接するので伸ばす
            merged[-1][1] = max(last_end, end)
        else:
            # 重ならないので新しい区間として追加
            merged.append([start, end])

    return merged


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        [[1, 3], [2, 6], [8, 10], [15, 18]],
        [[1, 4], [4, 5]],
        [[5, 5], [1, 2], [2, 3]],
    ]

    for i, intervals in enumerate(cases, start=1):
        print(f"例{i} 入力: {intervals}")
        print(
            f"例{i} 出力: {merge_intervals([x[:] for x in intervals])}"
        )  # コピーして破壊的変更を避ける
        print("-" * 40)
