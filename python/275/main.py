import heapq
from collections import Counter
from typing import List


def top_k_frequent(nums: List[int], k: int) -> List[int]:
    """
    配列 nums の中で出現回数が多い上位 k 個の値を返す。

    アルゴリズム:
      1. Counter で各値の頻度を数える: O(n)
      2. (freq, num) のペアを最小ヒープに入れつつ、サイズを k に保つ: O(U log k)
         (U は異なる値の個数, U <= n)
      3. ヒープ内に残った num を取り出せばそれが答え。

    時間計算量: O(n log k)
    追加メモリ: O(U)
    """
    # 各値の出現回数をカウント
    freq_map = Counter(nums)  # 要素数 U

    # 最小ヒープ (出現回数が小さいものが先頭)
    heap = []  # 要素は (freq, num)

    for num, freq in freq_map.items():
        heapq.heappush(heap, (freq, num))
        # ヒープサイズが k を超えたら、最小のものを捨てる
        if len(heap) > k:
            heapq.heappop(heap)

    # ヒープに残っている num が「上位 k 個」
    # 順番は問わないが、一応 freq 降順に並べ替えて返す例
    result = [num for freq, num in heap]
    return result


# 動作確認用: print で結果を出力
if __name__ == "__main__":
    nums1 = [1, 1, 1, 2, 2, 3]
    k1 = 2
    print(top_k_frequent(nums1, k1))

    nums2 = [4, 4, 4, 5, 6, 6, 7]
    k2 = 3
    print(top_k_frequent(nums2, k2))

    nums3 = [1]
    k3 = 1
    print(top_k_frequent(nums3, k3))

    nums4 = [1, 2, 3, 4]
    k4 = 2
    print(top_k_frequent(nums4, k4))
