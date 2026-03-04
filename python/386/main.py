from typing import List
from collections import Counter

def least_interval(tasks: List[str], n: int) -> int:
    """
    典型問題: Task Scheduler (Medium)

    最小時間は「最頻出タスク」を軸に決まる。

    max_count = 最大出現回数
    num_max   = max_count を持つタスク種類数

    骨格:
      (max_count - 1) 個の“隙間ブロック”があり、各ブロック長は (n+1)
      最後に max_count 回目のタスク群 (num_max) を足す

    ただし、タスクが十分多いと idle は不要になるので、答えは
      max( len(tasks), (max_count - 1)*(n+1) + num_max )

    計算量: O(len(tasks))
    """
    if n == 0:
        return len(tasks)

    freq = Counter(tasks)
    max_count = max(freq.values())
    num_max = sum(1 for v in freq.values() if v == max_count)

    frame = (max_count - 1) * (n + 1) + num_max
    return max(len(tasks), frame)

if __name__ == "__main__":
    print(least_interval(["A","A","A","B","B","B"], 2))  # 8
    print(least_interval(["A","A","A","B","B","B"], 0))  # 6
    print(least_interval(["A","A","A","A","B","C","D"], 2))  # 10
