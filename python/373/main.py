from typing import List
import heapq

def max_jobs(jobs: List[List[int]]) -> int:
    jobs.sort(key=lambda x: x[1])  # deadline でソート

    time = 0
    max_heap = []  # duration を -duration で保持（最大ヒープ相当）

    for duration, deadline in jobs:
        time += duration
        heapq.heappush(max_heap, -duration)

        if time > deadline:
            # 最も時間がかかるジョブを捨てる
            longest = -heapq.heappop(max_heap)
            time -= longest

    return len(max_heap)


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[3, 5], [2, 6], [1, 3]], 2),
        ([[5, 5], [4, 6], [2, 6]], 2),
        ([[1, 2], [2, 2], [3, 3]], 1),
    ]

    for i, (jobs, expected) in enumerate(cases, start=1):
        got = max_jobs(jobs)
        print(f"例{i} 入力: jobs={jobs}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
