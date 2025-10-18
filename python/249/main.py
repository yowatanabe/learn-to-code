from collections import deque
from typing import List


def shortest_slo_violation(errors: List[int], R: int) -> int:
    n = len(errors)
    if n == 0:
        return -1

    # b[i] = errors[i] - R, P[0]=0, P[k]=sum_{i<k} b[i]
    P = [0] * (n + 1)
    for i in range(1, n + 1):
        P[i] = P[i - 1] + (errors[i - 1] - R)

    ans = n + 1
    dq = deque()  # 累積和のインデックス（P が昇順になるよう保持）
    # 標準手順：先頭で条件満たす限り更新→末尾で単調性調整→現在 r を追加
    for r in range(n + 1):
        # 先頭から、P[r] - P[l] >= 0 を満たす限り答え更新
        while dq and P[r] - P[dq[0]] >= 0:
            ans = min(ans, r - dq[0])
            dq.popleft()

        # 末尾から、単調性を壊す値（P[末尾] >= P[r]）を削除
        while dq and P[dq[-1]] >= P[r]:
            dq.pop()

        dq.append(r)

    return ans if ans <= n else -1


print(shortest_slo_violation([0, 1, 3, 0, 2, 2], 2))
print(shortest_slo_violation([1, 1, 1, 1], 2))
print(shortest_slo_violation([2, 2, 2], 2))
