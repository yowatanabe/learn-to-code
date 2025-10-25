from collections import defaultdict
from typing import List


def count_target_alert_windows(alerts: List[int], T: int) -> int:
    """
    連続部分配列の和がちょうど T になる区間の個数を O(n) で数える。

    アルゴリズム:
      prefix[i] = alerts[0] + ... + alerts[i-1]  (prefix[0] = 0)
      ある r に対して、区間 (l..r) の和が T になるには
          prefix[r+1] - prefix[l] = T
        <=> prefix[l] = prefix[r+1] - T
      よって今の累積和 'cur' = prefix[r+1] から T を引いた値 (cur - T) が
      過去に何回出現したかを加算していけば良い。

    実装詳細:
      seen_sums[sum] = その prefix がこれまで何回出たか
      初期状態として prefix=0 が1回出たことにする（空の手前区間）。
    """
    seen_sums = defaultdict(int)
    seen_sums[0] = 1  # prefix sum 0 が最初に1回ある扱い

    cur = 0  # 現在の prefix sum
    ans = 0

    for x in alerts:
        cur += x  # prefix を更新
        need = cur - T
        # いまの位置を終端とする「和 = T」の区間の数は、
        # 過去に need が出た回数
        ans += seen_sums[need]
        # 現在の prefix sum を記録
        seen_sums[cur] += 1

    return ans


print(count_target_alert_windows([1, 2, 3], 3))
print(count_target_alert_windows([1, -1, 1, -1, 1], 0))
print(count_target_alert_windows([5], 5))
print(count_target_alert_windows([], 0))
print(count_target_alert_windows([2, 2, 2], 4))
