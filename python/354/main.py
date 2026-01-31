from typing import List, Tuple


def min_window_subsequence(logs: List[int], pattern: List[int]) -> List[int]:
    """
    Find the shortest contiguous window in logs that contains pattern as a subsequence.
    If multiple, choose the one with the smallest start index.
    Return the window values, or [] if not found.

    Approach:
      DP over logs with O(N*M) time and O(M) memory.
      dp[j] = earliest start index of a window ending at current i that matches pattern[:j+1] as subsequence.
    """
    n, m = len(logs), len(pattern)
    if m == 0:
        return []  # pattern empty not expected by constraints, but safe
    if n == 0 or m > n:
        return []

    # dp[j] = earliest start index for matching pattern[0..j] ending at current i
    dp = [-1] * m

    best_len = float("inf")
    best_l, best_r = -1, -1

    for i, x in enumerate(logs):
        # Update backwards to avoid overwriting dp[j-1] needed for current i
        for j in range(m - 1, -1, -1):
            if x != pattern[j]:
                continue

            if j == 0:
                dp[0] = i  # matching first element can start at i
            else:
                if dp[j - 1] != -1:
                    dp[j] = dp[j - 1]

        # If full pattern matched ending at i, check window
        if dp[m - 1] != -1:
            l = dp[m - 1]
            window_len = i - l + 1
            if window_len < best_len or (window_len == best_len and l < best_l):
                best_len = window_len
                best_l, best_r = l, i

    if best_l == -1:
        return []
    return logs[best_l : best_r + 1]


if __name__ == "__main__":
    cases = [
        ([7, 1, 2, 9, 3, 2, 1, 4, 2, 3], [1, 2, 3]),
        ([5, 1, 4, 2, 6, 3], [1, 2, 3]),
        ([1, 2, 2, 1, 2], [1, 2, 3]),
    ]

    for logs, pattern in cases:
        ans = min_window_subsequence(logs, pattern)
        print(f"logs={logs}, pattern={pattern} -> {ans}")
