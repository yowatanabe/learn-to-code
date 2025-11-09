from typing import List


def next_higher_latency(latency: List[int]) -> List[int]:
    """
    各インデックス i について、次に現在よりもレイテンシが厳密に大きい
    要素が現れるまでの分数 (j - i) を求める。
    存在しない場合は 0。

    アルゴリズム: 単調スタック (Monotonic Stack)
      - 右から左へ走査し、スタックには
        「まだ答えが決まっていないインデックス」を
        値が単調増加になるように保持する。
      - 具体的には、現在の latency[i] 以下の値は、
        「i より右側で i の次に大きい値になることはない」ため、
        スタックから取り除いてしまって良い。

      手順:
        1. ans = [0] * n で初期化
        2. スタックを空にしておく（格納するのはインデックス）
        3. i を右から左へ (n-1 から 0 まで) ループ:
             - while スタックが非空 かつ
                    latency[stack[-1]] <= latency[i]:
                   スタックから pop（次の候補にはなれない）
             - スタックが非空なら、
                   ans[i] = stack[-1] - i
               そうでなければ ans[i] = 0 のまま
             - i をスタックに push
    時間計算量: O(n)
    """
    n = len(latency)
    if n == 0:
        return []

    ans = [0] * n
    stack: List[int] = []  # インデックスを保持するスタック

    # 右から左へ
    for i in range(n - 1, -1, -1):
        # 自分以下の値は「次に大きい候補」にはなれないので取り除く
        while stack and latency[stack[-1]] <= latency[i]:
            stack.pop()

        # スタックの先頭が、次に厳密に大きいレイテンシ
        if stack:
            ans[i] = stack[-1] - i
        # そうでなければ ans[i] は 0 のまま

        # 現在位置をスタックに追加
        stack.append(i)

    return ans


print(next_higher_latency([30, 40, 35, 50, 45]))
print(next_higher_latency([100, 90, 80]))
print(next_higher_latency([10, 20, 30, 40]))
print(next_higher_latency([]))
