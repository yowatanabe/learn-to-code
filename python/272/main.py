import heapq
import math
from typing import List, Tuple


def smallest_common_range(logs: List[List[int]]) -> List[int]:
    """
    複数のソート済み配列 logs から、各配列から少なくとも1つずつ
    要素を選んだとき、全てを含む最小範囲 [L, R] を求める。
    存在しない場合は [] を返す。

    アルゴリズム:
      - k個の配列それぞれから「現在位置」を1つずつ持つ
      - 各配列の現在の値を最小ヒープに (値, シャード番号, インデックス) で入れる
      - 同時に現在値の「最大値」を current_max として追跡
      - ヒープから最小値を取り出し、その値を min_val とする
      - [min_val, current_max] が全シャードをカバーするレンジなので、
        これまでの最小レンジより小さければ更新
      - その最小値を出したシャードのポインタを1つ右に進め、
        新しい値をヒープに追加し、current_max も更新
      - どれかの配列が尽きたらループ終了（それ以上は全シャードをカバーできない）

    時間計算量: O(N log k), N = 全要素数, k = 配列数
    """
    k = len(logs)
    if k == 0:
        return []
    # 空配列があれば不可能
    for arr in logs:
        if not arr:
            return []

    # ヒープ初期化: 各シャードの先頭要素を入れる
    heap: List[Tuple[int, int, int]] = []  # (value, shard_index, index_in_shard)
    current_max = -math.inf

    for i in range(k):
        val = logs[i][0]
        heapq.heappush(heap, (val, i, 0))
        if val > current_max:
            current_max = val

    best_L, best_R = -math.inf, math.inf

    while True:
        min_val, shard_idx, idx_in_shard = heapq.heappop(heap)
        # 現在の範囲 [min_val, current_max] を候補として評価
        if current_max - min_val < best_R - best_L:
            best_L, best_R = min_val, current_max

        # このシャードの次の要素に進める
        next_idx = idx_in_shard + 1
        if next_idx == len(logs[shard_idx]):
            # このシャードはこれ以上進めないので、
            # これ以降は全シャードを同時にカバーすることができない
            break

        next_val = logs[shard_idx][next_idx]
        heapq.heappush(heap, (next_val, shard_idx, next_idx))
        # 最大値を更新
        if next_val > current_max:
            current_max = next_val

    if best_L == -math.inf and best_R == math.inf:
        # 何も更新されなかった（理論上は起きないはずだが念のため）
        return []
    return [best_L, best_R]


print(smallest_common_range([[1, 5, 8], [4, 12], [7, 8, 10]]))
print(smallest_common_range([[1, 2, 3], [1, 2, 3], [1, 2, 3]]))
print(smallest_common_range([[10, 20], [15], [5, 30, 31]]))
print(smallest_common_range([[], [1, 2, 3]]))
