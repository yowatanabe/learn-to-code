from typing import List

def count_merged_windows(windows: List[List[int]]) -> int:
    """
    区間を start でソートして、左から順にマージしていく。

    current_end まで見ていて、
    次の区間 start が current_end 以下なら重なる
    次の区間 start が current_end + 0 で等しい場合も接しているのでマージ
    つまり start <= current_end の条件に加え、
    問題では [a,b] と [b,c] も接しているのでマージ対象。
    区間は閉区間として扱うため、条件は start <= current_end で十分。

    計算量: O(n log n)
    """
    if not windows:
        return 0

    windows.sort(key=lambda x: x[0])

    count = 1
    current_start, current_end = windows[0]

    for start, end in windows[1:]:
        if start <= current_end:
            current_end = max(current_end, end)
        else:
            count += 1
            current_start, current_end = start, end

    return count


if __name__ == "__main__":
    print(count_merged_windows([[1, 3], [2, 5], [8, 10], [10, 12]])) # 2
    print(count_merged_windows([[1, 2], [4, 5], [7, 8]]))            # 3
    print(count_merged_windows([[5, 5], [1, 4], [4, 4]]))            # 2
