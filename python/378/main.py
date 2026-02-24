from typing import List

def min_merge_operations(t: List[int], k: int) -> int:
    """
    ゴール: すべてのグループが (max - min) <= k を満たすようにしつつ、
    できるだけマージしてグループ数を最小化する（＝マージ回数を最大化する）。

    左から貪欲に「入れられるだけ入れる」(最大長の区間) を作っていくと、
    グループ数が最小になり、マージ回数 (n - groups) が最大になる。

    計算量: O(n)
    """
    n = len(t)
    if n <= 1:
        return 0

    groups = 0
    left = 0

    for right in range(n):
        if t[right] - t[left] > k:
            groups += 1
            left = right

    groups += 1
    return n - groups


if __name__ == "__main__":
    print(min_merge_operations([1, 2, 4, 10, 11], 3))        # 3
    print(min_merge_operations([1, 5, 9], 2))                # 0
    print(min_merge_operations([1, 2, 100, 101, 102], 1))    # 2
