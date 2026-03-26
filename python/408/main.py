from typing import List
import heapq

def min_workers(intervals: List[List[int]]) -> int:
    """
    開始時刻順にジョブを見ていき、
    実行中ジョブの終了時刻を最小ヒープで管理する。

    - 新しいジョブの開始時刻 start までに終了しているジョブ
      (end <= start) はワーカーを再利用できる
    - その後、現在のジョブの終了時刻をヒープに追加する
    - ヒープのサイズが、その時点で必要なワーカー数

    計算量: O(n log n)
    """
    if not intervals:
        return 0

    intervals.sort(key=lambda x: x[0])
    heap = []
    answer = 0

    for start, end in intervals:
        while heap and heap[0] <= start:
            heapq.heappop(heap)

        heapq.heappush(heap, end)
        answer = max(answer, len(heap))

    return answer


if __name__ == "__main__":
    print(min_workers([[0, 30], [5, 10], [15, 20]]))       # 2
    print(min_workers([[7, 10], [2, 4]]))                  # 1
    print(min_workers([[1, 5], [2, 6], [4, 8], [9, 10]]))  # 3
