from typing import List, Tuple


def max_concurrent_tasks(intervals: List[List[int]]) -> int:
    events: List[Tuple[int, int]] = []
    for s, e in intervals:
        events.append((s, 1))  # start: +1
        events.append((e, -1))  # end:   -1

    # 同時刻は end(-1) を先に処理するため、delta の昇順でOK（-1 が先）
    events.sort(key=lambda x: (x[0], x[1]))

    cur = 0
    best = 0
    for _, delta in events:
        cur += delta
        if cur > best:
            best = cur

    return best


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[1, 5], [2, 6], [4, 8], [8, 9]], 3),
        ([[0, 10], [10, 20], [20, 30]], 1),
        ([[3, 7], [1, 4], [2, 5]], 3),
    ]

    for i, (intervals, expected) in enumerate(cases, start=1):
        got = max_concurrent_tasks(intervals)
        print(f"例{i} 入力: intervals={intervals}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
