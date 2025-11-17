from typing import List
import heapq


def min_servers_for_jobs(jobs: List[List[int]]) -> int:
    """
    半開区間 [start, end) で表されたジョブ一覧 jobs に対して、
    すべてのジョブを落とさずに実行するために必要なサーバ台数の最小値を求める。

    アルゴリズム:
      1. ジョブを開始時刻でソートする。
      2. 最小ヒープ (min-heap) に「現在稼働中のジョブの '終了時刻'」を入れておく。
      3. 各ジョブ (start, end) について:
         - ヒープの先頭 (最も早く終わるジョブの end) が start 以下なら、
           そのサーバは空いたので heap から pop して再利用可能。
         - 現在のジョブの end を heap に push（このサーバが新たに占有される）。
         - ヒープサイズ = 現在同時に走っているジョブ数 = 必要サーバ数。
      4. 処理中に観測した最大ヒープサイズが答え。

    時間計算量: O(n log n)
    追加メモリ: O(n)
    """
    if not jobs:
        return 0

    # 開始時刻でソート
    jobs.sort(key=lambda x: x[0])

    # 最小ヒープ: 現在走っているジョブの終了時刻
    min_heap: List[int] = []

    max_servers = 0

    for start, end in jobs:
        # すでに終わっているジョブをヒープから取り除いてサーバを解放
        while min_heap and min_heap[0] <= start:
            heapq.heappop(min_heap)

        # 今のジョブを新しく割り当てる（もしくは解放したサーバを再利用した扱い）
        heapq.heappush(min_heap, end)

        # 現在の同時実行数 = ヒープサイズ
        if len(min_heap) > max_servers:
            max_servers = len(min_heap)

    return max_servers


# 要求どおり print で結果をアウトプット
if __name__ == "__main__":
    # 例1
    jobs1 = [
        [0, 30],
        [5, 10],
        [15, 20],
    ]
    print(min_servers_for_jobs(jobs1))  # 2

    # 例2
    jobs2 = [
        [7, 10],
        [2, 4],
    ]
    print(min_servers_for_jobs(jobs2))  # 1

    # 例3
    jobs3 = [
        [1, 3],
        [3, 5],
        [5, 7],
    ]
    print(min_servers_for_jobs(jobs3))  # 1

    # 例4
    jobs4 = [
        [1, 4],
        [2, 5],
        [3, 6],
        [4, 7],
    ]
    print(min_servers_for_jobs(jobs4))  # 3

    # 例5
    jobs5: List[List[int]] = []
    print(min_servers_for_jobs(jobs5))  # 0
