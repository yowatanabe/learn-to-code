from typing import List
import heapq


def min_meeting_rooms(intervals: List[List[int]]) -> int:
    if not intervals:
        return 0

    # 開始時刻でソート
    intervals.sort(key=lambda x: x[0])

    # 各部屋の「終了時刻」を入れる min-heap
    ends = []
    heapq.heappush(ends, intervals[0][1])

    for start, end in intervals[1:]:
        # 最も早く空く部屋を再利用できるなら、その部屋の終了時刻を更新
        if ends[0] <= start:
            heapq.heapreplace(ends, end)  # popしてpushするより少し速い
        else:
            # 再利用できないので新しい部屋が必要
            heapq.heappush(ends, end)

    return len(ends)


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        [[0, 30], [5, 10], [15, 20]],
        [[7, 10], [2, 4]],
        [[1, 5], [2, 6], [4, 8], [9, 10]],
    ]

    for i, intervals in enumerate(cases, start=1):
        print(f"例{i} 入力: {intervals}")
        print(f"例{i} 出力: {min_meeting_rooms([x[:] for x in intervals])}")
        print("-" * 40)
