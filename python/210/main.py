from typing import List


def insert_interval(
    intervals: List[List[int]], newInterval: List[int]
) -> List[List[int]]:
    res = []
    i, n = 0, len(intervals)
    s, e = newInterval

    # 1) newInterval の前に位置する（重ならない）区間をそのまま追加
    while i < n and intervals[i][1] < s:
        res.append(intervals[i])
        i += 1

    # 2) 重なる区間をまとめてマージ
    merge_s, merge_e = s, e
    while i < n and intervals[i][0] <= merge_e:
        merge_s = min(merge_s, intervals[i][0])
        merge_e = max(merge_e, intervals[i][1])
        i += 1
    res.append([merge_s, merge_e])

    # 3) 残りを後ろに追加
    while i < n:
        res.append(intervals[i])
        i += 1

    return res


# テスト
print(insert_interval([[1, 3], [6, 9]], [2, 5]))  # [[1,5],[6,9]]
print(insert_interval([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]))
# [[1,2],[3,10],[12,16]]
print(insert_interval([], [5, 7]))  # [[5,7]]
print(insert_interval([[1, 5]], [2, 3]))  # [[1,5]]
print(insert_interval([[1, 5]], [6, 8]))  # [[1,5],[6,8]]
