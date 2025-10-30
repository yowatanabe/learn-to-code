from collections import defaultdict
from typing import Dict, List


def shortest_multiset_window(errors: List[str], need: Dict[str, int]) -> List[int]:
    """
    errors の連続区間で、各コード c の出現回数が need[c] 以上となる
    最短の [L, R] を返す。存在しない場合は []。
    時間 O(n)、追加メモリ O(|need|)。
    """
    n = len(errors)
    if n == 0 or not need:
        return []

    # 必要総数（種類ではなく、満たさねばならない「個数」の合計ではない点に注意）
    need_count = dict(need)  # 変更しないようコピー
    have: Dict[str, int] = defaultdict(int)

    # 「何種類が必要量を満たしたか」を追跡
    satisfied = 0
    required_types = len(need_count)

    best_len = n + 1
    best_L, best_R = -1, -1

    L = 0
    for R, code in enumerate(errors):
        # 右端に追加
        if code in need_count:
            have[code] += 1
            if have[code] == need_count[code]:
                satisfied += 1

        # すべての種類が必要回数を満たしたら、左を縮める
        while satisfied == required_types and L <= R:
            # 最短更新
            if R - L + 1 < best_len:
                best_len = R - L + 1
                best_L, best_R = L, R

            # 左端を外す
            left_code = errors[L]
            if left_code in need_count:
                if have[left_code] == need_count[left_code]:
                    satisfied -= 1
                have[left_code] -= 1
            L += 1

    return [best_L, best_R] if best_len <= n else []


print(
    shortest_multiset_window(
        errors=["500", "404", "500", "503", "404", "500"], need={"500": 2, "404": 1}
    )
)
print(shortest_multiset_window(errors=["x", "y"], need={"x": 2}))
print(shortest_multiset_window(errors=["only", "only", "a"], need={"only": 2}))
