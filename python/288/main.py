from collections import Counter
import heapq


def top_k_frequent(nums, k):
    """
    配列 nums から、出現回数が最も多い要素を上位 k 個返す。
    順番は問わない。
    """
    # 1. 各要素の出現回数をカウント
    freq = Counter(nums)  # 例: {1:3, 2:2, 3:1}

    # 2. (頻度, 値) のタプルで最小ヒープを作り、
    #    サイズが k を超えたら最小のものをpopして維持
    heap = []  # (count, num) の形で入れる（頻度で比較される）

    for num, count in freq.items():
        heapq.heappush(heap, (count, num))
        if len(heap) > k:
            heapq.heappop(heap)  # 最も頻度が小さいものを捨てる

    # 3. ヒープに残った要素が「上位 k 個」
    #    (count, num) から num だけ取り出す
    result = [num for count, num in heap]
    return result


if __name__ == "__main__":
    # 実行例1
    nums1 = [1, 1, 1, 2, 2, 3]
    k1 = 2
    print("例1の入力:", nums1, "k =", k1)
    print("例1の結果:", top_k_frequent(nums1, k1))  # [1, 2] など

    # 実行例2
    nums2 = [4, 4, 4, 6, 6, 7, 7, 7, 7]
    k2 = 1
    print("例2の入力:", nums2, "k =", k2)
    print("例2の結果:", top_k_frequent(nums2, k2))  # [7]

    # 実行例3
    nums3 = [5, 3, 5, 2, 2, 3]
    k3 = 3
    print("例3の入力:", nums3, "k =", k3)
    print("例3の結果:", top_k_frequent(nums3, k3))  # [5, 3, 2] など
