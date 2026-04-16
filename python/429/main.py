def merge_intervals(intervals):
    if not intervals:
        return []

    # 開始時刻でソート
    intervals.sort(key=lambda x: x[0])

    merged = [intervals[0]]

    for current_start, current_end in intervals[1:]:
        last_start, last_end = merged[-1]

        # 重なっている、または端で接している場合は統合
        if current_start <= last_end:
            merged[-1][1] = max(last_end, current_end)
        else:
            merged.append([current_start, current_end])

    return merged


# 実行例
intervals1 = [[1, 3], [2, 6], [8, 10], [15, 18]]
intervals2 = [[1, 4], [4, 5]]
intervals3 = [[5, 7], [1, 2], [2, 4]]

print(merge_intervals(intervals1))  # [[1, 6], [8, 10], [15, 18]]
print(merge_intervals(intervals2))  # [[1, 5]]
print(merge_intervals(intervals3))  # [[1, 4], [5, 7]]
