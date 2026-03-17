from typing import List

def longest_consecutive(nums: List[int]) -> int:
    """
    ハッシュセットを使う典型問題。

    ある値 x について、
    x-1 が存在しない場合だけ「連続列の開始点」とみなす。
    開始点から x+1, x+2, ... を数えていけば、
    各連続列を一度ずつだけ数えられる。

    計算量: O(n)
    """
    if not nums:
        return 0

    num_set = set(nums)
    best = 0

    for x in num_set:
        # x が連続列の先頭のときだけ数える
        if x - 1 not in num_set:
            length = 1
            current = x

            while current + 1 in num_set:
                current += 1
                length += 1

            best = max(best, length)

    return best


if __name__ == "__main__":
    print(longest_consecutive([100, 4, 200, 1, 3, 2]))              # 4
    print(longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]))      # 9
    print(longest_consecutive([10, 30, 20]))                        # 1
