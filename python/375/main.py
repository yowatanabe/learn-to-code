from typing import List
import heapq

def min_unique_sum(options: List[List[int]]) -> int:
    """
    各ジョブから値を1つ選ぶ。選んだ値はすべてユニーク。
    合計を最小化。不可能なら -1。

    発想:
    - 値（秒）を小さい順に「使える候補」をスイープする。
    - 各秒 t において、その秒までに「選べる候補」を持つジョブをヒープに積み、
      その秒 t を割り当てるジョブを1つ選ぶ。
    - 重要: t を割り当てるなら「次の候補が最も厳しい（選択肢が少ない）ジョブ」を優先する。
      ここでは「そのジョブの次に選べる値（次候補）」が小さいほど厳しい、とみなして優先。

    実装上は:
    - 各ジョブの候補配列を走査するポインタを持つ
    - (次候補値, job_id) をヒープに入れ、現在の t に割り当てる job を決める
    - ただし、現在の t を選べる job だけを候補にする

    計算量: O(M log N)  (M = 全候補数)
    """

    n = len(options)
    # 念のため、各 options[i] は昇順想定だが、同値があってもOK（扱える）
    # ただし同じ値を複数ジョブに割り当てるのは禁止なので、割当は値ごとに1回だけ。

    # 各ジョブの「今見ている候補インデックス」
    idx = [0] * n

    # (最初に登場する値, job_id) でイベントを作り、値の昇順で処理
    # ただし options[i][0] が存在する前提（空はないと仮定しないのでチェック）
    starts = []
    for i, arr in enumerate(options):
        if not arr:
            return -1
        starts.append((arr[0], i))
    starts.sort()

    # スイープ対象の値 t は、登場する値を順に見る（連続整数で走査しない）
    # ただし「ある値に割り当てたい」のは、その値が候補として存在する時だけで十分。
    # ここでは全候補値をまとめてソートして処理する。
    all_values = []
    for arr in options:
        all_values.extend(arr)
    all_values = sorted(set(all_values))  # 値はユニークに（同じ値は同じスロット扱い）

    # ヒープ: (次の候補値, job_id)
    # “次の候補値”とは「いま割り当て可能な値 t を使わなかった場合に次に取れる最小値」
    # ただし、いま割り当てる時点では t を割り当てるので、次候補は arr[idx+1] になる。
    heap = []

    # starts を進めるポインタ
    sp = 0

    assigned = [False] * n
    assigned_count = 0
    total = 0

    def push_if_can_take_t(job_id: int, t: int):
        """job_id が値 t を選べるなら、その job を heap に入れる（優先度=次候補値）。"""
        arr = options[job_id]
        j = idx[job_id]

        # idx を t 以上の最初に進める（これで「今選べる最小」が分かる）
        # ただし “t を選べる” 判定には「arr に t がある」必要があるので、t まで進める
        while j < len(arr) and arr[j] < t:
            j += 1
        idx[job_id] = j

        if j < len(arr) and arr[j] == t:
            # t を割り当てた後の次候補値（なければ INF）
            next_val = arr[j + 1] if (j + 1) < len(arr) else 10**30
            heapq.heappush(heap, (next_val, job_id))

    # スイープ
    for t in all_values:
        # この t から開始できるジョブ（最小候補が t 以下）を追加候補として処理
        while sp < n and starts[sp][0] <= t:
            _, job_id = starts[sp]
            sp += 1
            # この job が t を取れるなら heap に積む
            push_if_can_take_t(job_id, t)

        # 既に割当済みの job が heap に残っている場合があるので掃除
        while heap and assigned[heap[0][1]]:
            heapq.heappop(heap)

        # この値 t を誰かに割り当てられるなら割り当てる（値は1回しか使えない）
        if heap:
            _, job_id = heapq.heappop(heap)
            # job_id に t を割り当て
            assigned[job_id] = True
            assigned_count += 1
            total += t

            # 次回以降に備え、idx を t の次へ進めておく（t を消費したので）
            idx[job_id] += 1

            if assigned_count == n:
                return total

    return -1


if __name__ == "__main__":
    print(min_unique_sum([[1, 2, 4], [1, 3], [2, 3, 5]]))  # 6
    print(min_unique_sum([[0], [0]]))                      # -1
    print(min_unique_sum([[2, 2, 2], [2], [2, 3]]))         # -1
