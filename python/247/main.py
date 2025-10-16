from typing import List


def min_workers(intervals: List[List[int]]) -> int:
    """
    半開区間 [start, end) の重なり最大数 = 必要最小ワーカー数。
    two-pointer 法（開始時刻と終了時刻を個別にソート）で O(n log n)。

    アルゴリズム:
      1) starts = すべての start を昇順ソート
         ends   = すべての end   を昇順ソート
      2) s, e ポインタを 0 から進める:
           - starts[s] < ends[e] なら、新しいジョブが既存より先に始まる
             -> current += 1, s += 1, ans = max(ans, current)
           - そうでなければ（starts[s] >= ends[e]）ジョブが1つ終了
             -> current -= 1, e += 1
         ※ 半開区間のため、端点一致 (starts[s] == ends[e]) は「重ならない」扱いとし、
            先に end を消費してから start を処理する（比較を < で行う）
    """
    n = len(intervals)
    if n == 0:
        return 0

    starts = sorted(iv[0] for iv in intervals)
    ends = sorted(iv[1] for iv in intervals)

    s = e = 0
    current = 0
    ans = 0

    # どちらかを使い切るまで
    while s < n and e < n:
        if starts[s] < ends[e]:
            current += 1
            ans = max(ans, current)
            s += 1
        else:
            # starts[s] >= ends[e] のときに終了を優先して処理
            current -= 1 if current > 0 else 0
            e += 1

    # 残りの start は無くなるまで current を足す必要があるが、
    # それらは必ず end より後ろにあるので、ans は while 中で更新済み
    # よって追加処理は不要

    return ans


print(min_workers([[0, 10], [5, 12], [12, 20]]))
print(min_workers([[1, 2], [2, 3], [3, 4]]))
print(min_workers([[1, 5], [2, 6], [4, 8], [7, 9]]))
print(min_workers([]))
