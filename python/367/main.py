from typing import List

def erase_overlap_intervals(intervals: List[List[int]]) -> int:
    """
    貪欲:
    終了時刻でソートし、できるだけ多く区間を採用する（最大非重複数）。
    削除最小 = 全体数 - 採用最大
    """
    if not intervals:
        return 0

    intervals.sort(key=lambda x: x[1])  # end でソート

    keep = 0
    last_end = None

    for s, e in intervals:
        if last_end is None or s >= last_end:  # [start,end) なので s==last_end はOK
            keep += 1
            last_end = e

    return len(intervals) - keep


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[1, 2], [2, 3], [3, 4], [1, 3]], 1),
        ([[1, 2], [1, 2], [1, 2]], 2),
        ([[1, 2], [2, 3]], 0),
    ]

    for i, (intervals, expected) in enumerate(cases, start=1):
        got = erase_overlap_intervals(intervals)
        print(f"例{i} 入力: intervals={intervals}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
