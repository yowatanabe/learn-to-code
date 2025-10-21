from collections import defaultdict
from typing import Dict, List


def longest_subarray_with_at_most_k_distinct(users: List[str], K: int) -> int:
    """
    連続区間内の異なるユーザーIDの種類数が高々 K の最長長を O(n) で返す。
    K=0 のときは常に 0 を返す。
    """
    n = len(users)
    if n == 0 or K == 0:
        return 0

    freq: Dict[str, int] = defaultdict(int)
    distinct = 0
    l = 0
    best = 0

    for r, u in enumerate(users):
        if freq[u] == 0:
            distinct += 1
        freq[u] += 1

        # 種類数が K を超えたら左端を縮める
        while distinct > K:
            left_u = users[l]
            freq[left_u] -= 1
            if freq[left_u] == 0:
                distinct -= 1
            l += 1

        # 現在の有効窓 [l..r] の長さで更新
        best = max(best, r - l + 1)

    return best


print(longest_subarray_with_at_most_k_distinct(["a", "b", "a", "c", "b", "b"], 2))
print(longest_subarray_with_at_most_k_distinct(["u1", "u2", "u3", "u1", "u2", "u1"], 2))
print(longest_subarray_with_at_most_k_distinct(["x", "y", "z"], 1))
print(longest_subarray_with_at_most_k_distinct([], 3))
print(longest_subarray_with_at_most_k_distinct(["a", "a", "a"], 0))
