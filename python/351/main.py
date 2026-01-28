from typing import List, Dict
from collections import defaultdict


def longest_subarray_at_most_two_distinct(events: List[int]) -> int:
    cnt: Dict[int, int] = defaultdict(int)
    left = 0
    best = 0

    for right, x in enumerate(events):
        cnt[x] += 1

        while len(cnt) > 2:
            y = events[left]
            cnt[y] -= 1
            if cnt[y] == 0:
                del cnt[y]
            left += 1

        best = max(best, right - left + 1)

    return best


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 1], 3),
        ([0, 1, 2, 2], 3),
        ([1, 2, 3, 2, 2], 4),
    ]

    for i, (events, expected) in enumerate(cases, start=1):
        got = longest_subarray_at_most_two_distinct(events)
        print(f"例{i} 入力: events={events}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
