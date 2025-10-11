import heapq
from typing import List


def min_meeting_rooms(intervals: List[List[int]]) -> int:
    """
    最小ヒープで「現在使用中の会議室の終了時刻」を管理。
    手順:
      1) 開始時刻でソート
      2) 各会議について、最も早く終わる会議(ヒープ最小)の終了時刻 <= 開始時刻 なら部屋再利用: pop
         そうでなければ新しい部屋が必要
      3) 現会議の終了時刻を push
    ヒープサイズの最大値が必要部屋数。O(n log n)
    """
    if not intervals:
        return 0

    intervals.sort(key=lambda x: x[0])  # 開始時刻でソート
    heap = []  # 会議室ごとの「終了時刻」を格納する最小ヒープ

    for s, e in intervals:
        # 終了時刻 <= s なら同室再利用（[start, end) なので end==s は衝突しない）
        if heap and heap[0] <= s:
            heapq.heappop(heap)
        heapq.heappush(heap, e)

    return len(heap)


# テスト
print(min_meeting_rooms([[0, 30], [5, 10], [15, 20]]))  # 2
print(min_meeting_rooms([[7, 10], [2, 4]]))  # 1
print(min_meeting_rooms([[1, 5], [5, 10], [10, 15]]))  # 1
print(min_meeting_rooms([]))  # 0
