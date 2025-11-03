from collections import deque
from typing import List


def shortest_path_with_k_breaks(grid: List[List[int]], K: int) -> int:
    """
    0/1グリッド上で、最大K個まで1セルを踏み抜けるときの
    (0,0) から (m-1,n-1) までの最短ステップ数をBFSで求める。
    到達不可なら -1 を返す。
    """
    if not grid or not grid[0]:
        return -1

    m, n = len(grid), len(grid[0])

    # 特別ケース: 開始がゴール
    if m == 1 and n == 1:
        # 開始セルが障害でも、K>=1なら0ステップで到達
        if grid[0][0] == 1 and K == 0:
            return -1
        return 0

    # visited[r][c][used] = その状態に到達済みかどうか
    # used は 0..K の範囲
    # K がそこまで大きくない想定なら 3次元配列でOK
    visited = [[[False] * (K + 1) for _ in range(n)] for _ in range(m)]

    # 開始セルで障害を踏むかどうか
    start_used = grid[0][0]
    if start_used > K:
        return -1  # 開始地点が障害で、Kが足りない
    visited[0][0][start_used] = True

    # BFSキュー: (r, c, used, dist)
    q = deque()
    q.append((0, 0, start_used, 0))

    # 4方向
    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while q:
        r, c, used, dist = q.popleft()

        for dr, dc in dirs:
            nr, nc = r + dr, c + dc
            # グリッド外は無視
            if nr < 0 or nr >= m or nc < 0 or nc >= n:
                continue

            new_used = used + grid[nr][nc]
            if new_used > K:
                continue

            # ゴールに到達したら dist+1 を返す
            if nr == m - 1 and nc == n - 1:
                return dist + 1

            if not visited[nr][nc][new_used]:
                visited[nr][nc][new_used] = True
                q.append((nr, nc, new_used, dist + 1))

    # どの状態でもゴールに届かなかった
    return -1


print(shortest_path_with_k_breaks([[0, 0, 0], [1, 1, 0], [0, 0, 0]], 1))
print(shortest_path_with_k_breaks([[0, 1, 0], [1, 1, 0], [0, 0, 0]], 2))
print(shortest_path_with_k_breaks([[0, 1, 1], [1, 1, 1], [1, 1, 0]], 1))
print(shortest_path_with_k_breaks([[1, 0], [0, 0]], 1))
