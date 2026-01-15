from typing import List


def min_meeting_rooms(intervals: List[List[int]]) -> int:
    n = len(intervals)
    starts = sorted(iv[0] for iv in intervals)
    ends = sorted(iv[1] for iv in intervals)

    rooms = 0
    end_i = 0

    for s in starts:
        if s < ends[end_i]:
            rooms += 1  # まだ部屋が空かない
        else:
            end_i += 1  # 1部屋空いたので再利用

    return rooms


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[0, 30], [5, 10], [15, 20]], 2),
        ([[7, 10], [2, 4]], 1),
        ([[1, 5], [5, 10], [10, 15]], 1),
    ]

    for i, (intervals, expected) in enumerate(cases, start=1):
        got = min_meeting_rooms(intervals)
        print(f"例{i} 入力: intervals={intervals}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
