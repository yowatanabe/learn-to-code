from typing import List


def merge(intervals: List[List[int]]) -> List[List[int]]:
    if not intervals:
        return []

    # start 昇順でソート
    intervals.sort(key=lambda x: x[0])
    merged = []
    cur_start, cur_end = intervals[0]

    for s, e in intervals[1:]:
        if s <= cur_end:  # 重なる or 接する
            cur_end = max(cur_end, e)  # 区間を拡張
        else:
            merged.append([cur_start, cur_end])
            cur_start, cur_end = s, e

    merged.append([cur_start, cur_end])
    return merged


# テスト
print(merge([[1, 3], [2, 6], [8, 10], [15, 18]]))  # [[1,6],[8,10],[15,18]]
print(merge([[1, 4], [4, 5]]))  # [[1,5]]
print(merge([[6, 7], [1, 2], [3, 5]]))  # [[1,2],[3,5],[6,7]]
