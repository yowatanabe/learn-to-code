from typing import Tuple
import heapq
from collections import deque


def min_ops_with_cooldown(s: str, t: str, k: int) -> int:
    n = len(s)
    if n != len(t):
        return -1

    # 必要シフト回数 d[i] を数える（0..25）
    need = []
    total = 0
    for i in range(n):
        ds = (ord(t[i]) - ord(s[i])) % 26
        if ds > 0:
            need.append((ds, i))
            total += ds

    if total == 0:
        return 0

    # インデックスが1つしかなく、クールダウンがあるのに複数回叩く必要があるなら無理
    # （待機ができないため）
    if n == 1 and total > 1 and k > 0:
        return -1

    # max-heap: (-remaining, idx)
    heap = [(-cnt, idx) for cnt, idx in need]
    heapq.heapify(heap)

    # cooldown queue: (available_time, -remaining, idx)
    cooldown = deque()

    # 各時刻で1回操作する。最小回数は total なので、0..total-1 でシミュレーション
    for time in range(total):
        # クールダウン解除されたものを heap に戻す
        while cooldown and cooldown[0][0] <= time:
            _, neg_rem, idx = cooldown.popleft()
            heapq.heappush(heap, (neg_rem, idx))

        if not heap:
            # 叩けるインデックスが無い＝待機が必要になるが、それは不可
            return -1

        neg_rem, idx = heapq.heappop(heap)
        rem = -neg_rem

        # idx を1回叩く（残り回数を減らす）
        rem -= 1

        if rem > 0:
            # 次にこの idx を叩けるのは time + k + 1
            available = time + k + 1
            cooldown.append((available, -rem, idx))

    # total 回ちょうどで全タスクを消化できた
    return total


if __name__ == "__main__":
    # 例1
    s1, t1, k1 = "abc", "bcd", 1
    print("例1:", s1, t1, "k=", k1, "=>", min_ops_with_cooldown(s1, t1, k1))  # 3

    # 例2
    s2, t2, k2 = "a", "z", 2
    print("例2:", s2, t2, "k=", k2, "=>", min_ops_with_cooldown(s2, t2, k2))  # -1

    # 例3
    s3, t3, k3 = "az", "ba", 1
    print("例3:", s3, t3, "k=", k3, "=>", min_ops_with_cooldown(s3, t3, k3))  # 2
