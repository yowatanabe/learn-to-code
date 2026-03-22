from typing import List
from collections import defaultdict

def count_subarrays_sum_k(nums: List[int], k: int) -> int:
    """
    prefix sum + hashmap の典型問題。

    prefix[i] を「先頭から i までの累積和」とする。
    ある区間 (l..r) の合計が k になる条件は、

        prefix[r] - prefix[l-1] = k

    変形すると、

        prefix[l-1] = prefix[r] - k

    つまり、現在の累積和を s とすると、
    これまでに (s - k) が何回出たかを数えればよい。

    計算量: O(n)
    """
    count = defaultdict(int)
    count[0] = 1  # 累積和 0 を最初に1回見たことにする

    prefix_sum = 0
    answer = 0

    for x in nums:
        prefix_sum += x
        answer += count[prefix_sum - k]
        count[prefix_sum] += 1

    return answer


if __name__ == "__main__":
    print(count_subarrays_sum_k([1, 1, 1], 2))                    # 2
    print(count_subarrays_sum_k([1, 2, 3], 3))                    # 2
    print(count_subarrays_sum_k([3, 4, 7, 2, -3, 1, 4, 2], 7))    # 4
