from typing import List
from collections import Counter

def top_k_frequent(events: List[int], k: int) -> List[int]:
    """
    Counter で出現回数を数え、頻度の高い順に k 個返す。

    計算量:
      - カウント: O(n)
      - ソート: O(m log m)
        (m は異なる要素数)
    """
    freq = Counter(events)

    # 出現回数の降順でソート
    sorted_items = sorted(freq.items(), key=lambda x: x[1], reverse=True)

    # 上位 k 個のキーを取り出す
    return [num for num, count in sorted_items[:k]]


if __name__ == "__main__":
    print(top_k_frequent([1, 1, 1, 2, 2, 3], 2))          # [1, 2]
    print(top_k_frequent([4], 1))                         # [4]
    print(top_k_frequent([5, 5, 6, 6, 6, 7, 7, 7, 7], 2))  # [7, 6]
