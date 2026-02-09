from typing import List
from collections import deque

def shortest_subarray_at_least_k(nums: List[int], k: int) -> int:
    """
    prefix sums + monotonic deque
    時間: O(n), 空間: O(n)

    prefix[i] = nums[0] + ... + nums[i-1]  (prefix[0]=0)
    ある区間 [j, i) の和 = prefix[i] - prefix[j]
    これが k 以上 -> prefix[j] <= prefix[i] - k
    """
    n = len(nums)
    prefix = [0] * (n + 1)
    for i in range(n):
        prefix[i + 1] = prefix[i] + nums[i]

    ans = n + 1
    dq = deque()  # prefix の index を保持。prefix 値が単調増加になるよう維持

    for i in range(n + 1):
        # 1) 条件を満たす限り、左端を詰めて最短を更新
        while dq and prefix[i] - prefix[dq[0]] >= k:
            ans = min(ans, i - dq[0])
            dq.popleft()

        # 2) prefix[i] が小さいほど有利なので、単調増加を保つ
        while dq and prefix[i] <= prefix[dq[-1]]:
            dq.pop()

        dq.append(i)

    return -1 if ans == n + 1 else ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([2, -1, 2], 3, 3),
        ([1, 2], 4, -1),
        ([1, -1, 5, -2, 3], 3, 1),
        ([-2, -1, 2, 1], 1, 1),
    ]

    for i, (nums, k, expected) in enumerate(cases, start=1):
        got = shortest_subarray_at_least_k(nums, k)
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
