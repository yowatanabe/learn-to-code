from collections import deque
from typing import List


def shortest_subarray(nums: List[int], k: int) -> int:
    n = len(nums)

    # 累積和 prefix
    prefix = [0] * (n + 1)
    for i in range(n):
        prefix[i + 1] = prefix[i] + nums[i]

    ans = n + 1
    dq = deque()  # prefix のインデックスを保持（prefix値が単調増加）

    for i in range(n + 1):
        # 1) 条件を満たす間、前から削って最短を更新
        while dq and prefix[i] - prefix[dq[0]] >= k:
            ans = min(ans, i - dq[0])
            dq.popleft()

        # 2) prefix が単調増加になるように、後ろを削る
        while dq and prefix[i] <= prefix[dq[-1]]:
            dq.pop()

        dq.append(i)

    return -1 if ans == n + 1 else ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([2, -1, 2], 3),
        ([1, 2], 4),
        ([84, -37, 32, 40, 95], 167),
    ]

    for i, (nums, k) in enumerate(cases, start=1):
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {shortest_subarray(nums, k)}")
        print("-" * 40)
