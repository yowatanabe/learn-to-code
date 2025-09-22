from collections import Counter
from typing import List


def least_interval(tasks: List[str], n: int) -> int:
    """
    公式解の数え上げ式:
      max_freq = 最頻タスクの出現回数
      max_count = その回数のタスク種類数
      枠組み (max_freq - 1) ブロック × (n + 1) + 最後の列に max_count を置く
      答えは tasks の総数との最大値
      res = max(len(tasks), (max_freq - 1) * (n + 1) + max_count)
    """
    freq = Counter(tasks)
    max_freq = max(freq.values())
    max_count = sum(1 for v in freq.values() if v == max_freq)
    return max(len(tasks), (max_freq - 1) * (n + 1) + max_count)


# テスト
print(least_interval(["A", "A", "A", "B", "B", "B"], 2))  # 8
print(least_interval(["A", "A", "A", "B", "B", "B"], 0))  # 6
print(least_interval(["A", "A", "A", "A", "B", "C", "D"], 3))  # 13
