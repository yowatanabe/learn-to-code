from typing import List

def merge_intervals(intervals: List[List[int]]) -> List[List[int]]:
    """
    区間を start でソートして、左から順にマージしていく。

    current と次の区間 nxt について、
    nxt[0] <= current[1] なら重なっているのでマージできる。
    そうでなければ current を確定して次へ進む。

    計算量: O(n log n)  # ソートのため
    """
    if not intervals:
        return []

    intervals.sort(key=lambda x: x[0])

    merged = []
    current_start, current_end = intervals[0]

    for start, end in intervals[1:]:
        if start <= current_end:
            current_end = max(current_end, end)
        else:
            merged.append([current_start, current_end])
            current_start, current_end = start, end

    merged.append([current_start, current_end])
    return merged


if __name__ == "__main__":
    print(merge_intervals([[1, 3], [2, 6], [8, 10], [15, 18]]))
    # [[1, 6], [8, 10], [15, 18]]

    print(merge_intervals([[1, 4], [4, 5]]))
    # [[1, 5]]

    print(merge_intervals([[5, 7], [1, 2], [2, 4]]))
    # [[1, 4], [5, 7]]
