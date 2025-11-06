from bisect import bisect_left
from typing import List


def longest_increasing_traffic(traffic: List[int]) -> int:
    """
    厳密増加部分列(LIS)の長さを O(n log n) で求める。

    アルゴリズム（いわゆる「パATIENCEソーティング」風DP）:
      tails[len] = 長さ len の増加部分列の末尾としてありうる
                   値の「最小値」を保持する配列（1-index風の概念だが、実装は0-index）。

      各 x に対して:
        - tails の中で x を挿入可能な位置 pos を二分探索で求める
        - tails[pos] を x で更新
      こうして tails の実際に使われている長さが LIS の長さになる。

    直 intuition:
      - 末尾が小さい方が後ろに続けやすい。
      - なので「同じ長さの増加列の末尾は、なるべく小さい値で更新する」のが吉。
    """
    if not traffic:
        return 0

    tails: List[int] = []

    for x in traffic:
        # tails の中で x を挿入すべき位置を二分探索する
        # tails は常に昇順になっている
        pos = bisect_left(tails, x)
        if pos == len(tails):
            # x は今あるどの末尾よりも大きいので、新たな長さのLISを作れる
            tails.append(x)
        else:
            # 既存の長さ pos+1 の末尾を、より小さい x で更新
            tails[pos] = x

    return len(tails)


print(longest_increasing_traffic([10, 9, 2, 5, 3, 7, 101, 18]))
print(longest_increasing_traffic([0, 1, 0, 3, 2, 3]))
print(longest_increasing_traffic([7, 7, 7, 7]))
print(longest_increasing_traffic([]))
