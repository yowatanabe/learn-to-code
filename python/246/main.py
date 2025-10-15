from collections import deque
from typing import List


def sliding_window_rate_limit(timestamps: List[int], W: int, C: int) -> List[int]:
    """
    与えられた到着時刻列に対し、滑動窓 [t - W + 1, t] (両端含む) 内の
    許可済み件数が C 未満なら 1(許可)、そうでなければ 0(拒否) を返す。
    O(n) 時間、O(n) 追加メモリ。

    ポイント:
      - 許可した時刻のみを deque に保持（単調性は不要）。
      - 各到着 t について、deque 先頭から範囲外 (< t - W + 1) を削除。
      - その時点の deque 長が C 未満なら許可し t を追加、そうでなければ拒否。
      - W=0 のときは窓が [t, t] になり、同一時刻の上限 C で判定される。
    """
    n = len(timestamps)
    ans = [0] * n
    allowed = deque()  # 許可済み到着時刻だけを保持

    for i, t in enumerate(timestamps):
        # 現在の滑動窓の左端（含む）
        left = t - W + 1 if W > 0 else t  # W=0 のとき left=t とする
        # 窓外の許可を先頭から捨てる
        while allowed and allowed[0] < left:
            allowed.popleft()

        if len(allowed) < C:
            # 許可
            ans[i] = 1
            allowed.append(t)
        else:
            # 拒否
            ans[i] = 0

    return ans


print(sliding_window_rate_limit([1, 1, 2, 2, 3, 10, 10, 11], 3, 3))
print(sliding_window_rate_limit([5, 5, 5, 5], 0, 2))
print(sliding_window_rate_limit([0, 1, 2, 3, 4], 5, 10))
print(sliding_window_rate_limit([], 10, 1))
