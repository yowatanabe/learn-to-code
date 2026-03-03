from typing import List

def longest_zero_sum_subarray(delta: List[int]) -> int:
    """
    prefix sum を使う典型問題（Medium）。
    prefix[i] = delta[0] + ... + delta[i]
    区間 (l..r) の合計が0 <=> prefix[r] == prefix[l-1]

    つまり、同じ prefix sum が最初に出現した位置を覚えておけば、
    その後に同じ値が出た時に最長区間を更新できる。

    計算量: O(n)
    """
    first_index = {0: -1}  # prefix sum 0 が「配列の手前」にある扱い
    s = 0
    best = 0

    for i, x in enumerate(delta):
        s += x
        if s in first_index:
            best = max(best, i - first_index[s])
        else:
            first_index[s] = i

    return best

if __name__ == "__main__":
    print(longest_zero_sum_subarray([1, -1, 2, -2, 3]))  # 4
    print(longest_zero_sum_subarray([1, 2, 3]))          # 0
    print(longest_zero_sum_subarray([2, -2, 2, -2]))     # 4
