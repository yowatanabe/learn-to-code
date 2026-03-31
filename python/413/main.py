from typing import List

def erase_overlap_intervals(intervals: List[List[int]]) -> int:
    """
    重ならない区間をできるだけ多く残せば、
    削除本数は最小になる。

    Greedy:
    - 終了時刻が早い順にソート
    - 前に採用した区間の end 以降に始まる区間だけ採用する
    - 採用できなかった区間数が答え

    計算量: O(n log n)
    """
    intervals.sort(key=lambda x: x[1])

    kept = 0
    prev_end = -10**30

    for start, end in intervals:
        if start >= prev_end:
            kept += 1
            prev_end = end

    return len(intervals) - kept


if __name__ == "__main__":
    print(erase_overlap_intervals([[1, 2], [2, 3], [3, 4], [1, 3]]))  # 1
    print(erase_overlap_intervals([[1, 2], [1, 2], [1, 2]]))          # 2
    print(erase_overlap_intervals([[1, 2], [2, 3]]))                  # 0
