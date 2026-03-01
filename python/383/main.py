from typing import List
from collections import deque, defaultdict

def filter_no_repeat_within_k(ids: List[int], k: int) -> List[int]:
    """
    out の直近 k 件に同じIDがあれば捨てるフィルタ。

    方針:
    - 直近k件のIDの出現数をカウントする辞書 cnt を持つ
    - out に追加したIDをキュー window に積む（最大サイズ k）
    - 追加時:
        - もし cnt[id] > 0 なら直近k件に存在 → 捨てる
        - そうでなければ追加し、window と cnt を更新
    - window が k を超えたら古いIDを1つ落とし cnt を減らす

    計算量: O(n)
    """
    if k <= 0:
        # 本制約では k>=1 だが安全のため
        return ids[:]

    out: List[int] = []
    window = deque()           # out の末尾側から最大 k 個
    cnt = defaultdict(int)     # window 内の出現数

    for x in ids:
        if cnt[x] > 0:
            continue  # 直近k件に同じIDがあるので捨てる

        # out に追加
        out.append(x)
        window.append(x)
        cnt[x] += 1

        # window を最大 k に保つ
        if len(window) > k:
            old = window.popleft()
            cnt[old] -= 1
            if cnt[old] == 0:
                del cnt[old]

    return out

if __name__ == "__main__":
    print(filter_no_repeat_within_k([1, 2, 1, 3, 1, 2], 2))   # [1, 2, 3, 1, 2]
    print(filter_no_repeat_within_k([5, 5, 5, 5], 1))         # [5]
    print(filter_no_repeat_within_k([1, 2, 3, 1, 2, 3], 3))   # [1, 2, 3]
