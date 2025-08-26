import heapq
from typing import List


def min_meeting_rooms(intervals: List[List[int]]) -> int:
    if not intervals:
        return 0

    # 開始時刻でソート
    intervals.sort(key=lambda x: x[0])

    # 最小ヒープに「現在使用中の部屋の終了時刻」を格納
    rooms = []  # 各部屋の最も早い終了時刻を管理
    for start, end in intervals:
        # もし最も早く空く部屋の終了時刻 <= 今の会議の開始時刻なら、その部屋を再利用
        if rooms and rooms[0] <= start:
            heapq.heapreplace(rooms, end)  # 先頭を新しい終了時刻に置き換え
        else:
            heapq.heappush(rooms, end)  # 新しい部屋を追加

    # ヒープのサイズが同時に必要な部屋数
    return len(rooms)


# テスト
print(min_meeting_rooms([[0, 30], [5, 10], [15, 20]]))  # 2
print(min_meeting_rooms([[7, 10], [2, 4]]))  # 1
print(min_meeting_rooms([[1, 5], [2, 6], [4, 8], [9, 10]]))  # 3
