from typing import List


def wait_until_higher_usage(usage: List[int], delta: int) -> List[int]:
    """
    単調スタックで次に「厳密に高い」使用率が現れるまでの待ち時間（秒）を求める。
    スタックには「まだ次が見つかっていないインデックス」を、値が降順になるよう保持する。

    例:
      usage = [30, 40, 35, 50, 45], delta = 10
      -> [10, 20, 10, 0, 0]
    時間計算量 O(n), 追加メモリ O(n)
    """
    n = len(usage)
    ans = [0] * n
    stack: List[int] = []  # usage が降順となるようインデックスを保持

    for i, x in enumerate(usage):
        # 現在値 x がスタック頂上の値より大きければ、「次のより高い値」が確定
        while stack and usage[stack[-1]] < x:
            j = stack.pop()
            ans[j] = (i - j) * delta
        stack.append(i)

    # スタックに残った要素は次に高い値がない -> 既定値0のまま
    return ans


print(wait_until_higher_usage([30, 40, 35, 50, 45], 10))
print(wait_until_higher_usage([70, 70, 70], 5))
print(wait_until_higher_usage([10, 20, 30], 3))
print(wait_until_higher_usage([], 1))
