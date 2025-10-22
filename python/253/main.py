from collections import defaultdict
from typing import Dict, List, Set


def shortest_covering_window(logs: List[str], need: Set[str]) -> List[int]:
    """
    logs の連続区間のうち、need の全要素を少なくとも1回含む最短 [L, R] を返す。
    存在しなければ []。時間 O(n)、追加メモリ O(|need|)。
    """
    n = len(logs)
    if n == 0 or len(need) == 0:
        # need が空集合なら「長さ0の空区間」を定義しない前提で [] を返す
        return []

    need_set = set(need)  # 念のためコピー
    window: Dict[str, int] = defaultdict(int)
    have = 0  # 現在ウィンドウで「必要種類を満たした数」
    required = len(need_set)

    best_len = n + 1
    best_L, best_R = -1, -1

    L = 0
    for R, svc in enumerate(logs):
        # 右端に追加
        window[svc] += 1
        if svc in need_set and window[svc] == 1:
            # この種類を初めて満たした
            have += 1

        # すべて満たしたら左を縮める
        while have == required and L <= R:
            # 最短更新
            if R - L + 1 < best_len:
                best_len = R - L + 1
                best_L, best_R = L, R

            # 左端を1つ外す
            left_svc = logs[L]
            window[left_svc] -= 1
            if left_svc in need_set and window[left_svc] == 0:
                have -= 1
            L += 1

    return [best_L, best_R] if best_len <= n else []


print(
    shortest_covering_window(
        ["auth", "pay", "search", "auth", "cart", "pay", "search"], {"pay", "search"}
    )
)
print(shortest_covering_window(["A", "B", "A", "C", "B", "A"], {"A", "B", "C"}))
print(shortest_covering_window(["x", "y"], {"z"}))
print(shortest_covering_window([], {"a"}))
print(shortest_covering_window(["only"], {"only"}))
