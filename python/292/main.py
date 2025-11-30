from typing import List


def merge_intervals(intervals: List[List[int]]) -> List[List[int]]:
    """
    与えられた区間リストをマージして返す。
    重なりがある区間は1つにまとめる。
    """
    if not intervals:
        return []

    # 1. start の昇順でソート
    intervals.sort(key=lambda x: x[0])

    merged = []
    # 最初の区間を現在の区間としてセット
    current_start, current_end = intervals[0]

    for i in range(1, len(intervals)):
        start, end = intervals[i]

        # 2. 現在の区間と重なるかどうか判定
        # [current_start, current_end] と [start, end] が重なる条件:
        # start <= current_end
        if start <= current_end:
            # 重なるので end を広げる（最大値をとる）
            current_end = max(current_end, end)
        else:
            # 重ならないので、今までの区間を確定させて結果に追加し、
            # 新しい現在区間として更新
            merged.append([current_start, current_end])
            current_start, current_end = start, end

    # 最後に残った区間も追加
    merged.append([current_start, current_end])

    return merged


if __name__ == "__main__":
    # 実行例1
    intervals1 = [[1, 3], [2, 6], [8, 10], [15, 18]]
    print("例1の入力:", intervals1)
    print("例1の結果:", merge_intervals(intervals1))  # [[1,6],[8,10],[15,18]]

    # 実行例2
    intervals2 = [[1, 4], [4, 5]]
    print("例2の入力:", intervals2)
    print("例2の結果:", merge_intervals(intervals2))  # [[1,5]]

    # 実行例3
    intervals3 = [[1, 2]]
    print("例3の入力:", intervals3)
    print("例3の結果:", merge_intervals(intervals3))  # [[1,2]]
