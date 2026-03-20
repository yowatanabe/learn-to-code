from typing import List
import heapq

def min_workers(jobs: List[List[int]]) -> int:
    """
    開始時刻順にジョブを見ていき、
    実行中ジョブの終了時刻を最小ヒープで管理する。

    新しいジョブ [start, end) を処理する時:
    - 既に終了しているジョブ（終了時刻 <= start）はワーカーを再利用できるのでヒープから取り除く
    - 現在のジョブの end をヒープに追加する
    - ヒープのサイズ = 現在必要なワーカー数

    その最大値が答え。

    計算量: O(n log n)
    """
    if not jobs:
        return 0

    jobs.sort(key=lambda x: x[0])  # 開始時刻でソート
    heap = []  # 実行中ジョブの終了時刻
    answer = 0

    for start, end in jobs:
        while heap and heap[0] <= start:
            heapq.heappop(heap)

        heapq.heappush(heap, end)
        answer = max(answer, len(heap))

    return answer


if __name__ == "__main__":
    print(min_workers([[0, 30], [5, 10], [15, 20]]))       # 2
    print(min_workers([[7, 10], [2, 4]]))                  # 1
    print(min_workers([[1, 5], [2, 6], [4, 8], [9, 10]]))  # 3
