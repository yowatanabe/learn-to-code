from collections import Counter
from typing import List


def top_k_frequent(nums: List[int], k: int) -> List[int]:
    """
    バケットソート方式: 出現回数 f ごとに要素を buckets[f] に入れる。
    出現回数は最大で len(nums) なので、バケットを後ろから集めれば O(n)。
    時間: O(n)（カウントと1パス収集）
    追加メモリ: O(n)
    """
    freq = Counter(nums)  # 値 -> 出現回数
    buckets = [[] for _ in range(len(nums) + 1)]
    for val, f in freq.items():
        buckets[f].append(val)

    ans = []
    for f in range(len(nums), 0, -1):  # 高頻度から取り出す
        if buckets[f]:
            ans.extend(buckets[f])
            if len(ans) >= k:
                return ans[:k]
    return ans[:k]  # 保険


# テスト
print(top_k_frequent([1, 1, 1, 2, 2, 3], 2))  # [1,2]
print(top_k_frequent([4, 4, 4, 4], 1))  # [4]
print(top_k_frequent([1, 2, 3, 4], 3))  # [1,2,3]（順不同）
