from typing import List
from collections import Counter

def minimum_rounds(tasks: List[int]) -> int:
    """
    同じ種類ごとに個数を数えて、各個数 c に対する最小ラウンド数を足し合わせる。

    1ラウンドで処理できるのは 2 個または 3 個。

    観察:
    - c == 1 のときは不可能
    - それ以外は、できるだけ 3 個ずつ処理するのがラウンド数最小
    - 実は c >= 2 のとき最小ラウンド数は ceil(c / 3) に等しい
      ただし整数演算では (c + 2) // 3 で求められる

    例:
    - c = 2 -> 1
    - c = 3 -> 1
    - c = 4 -> 2   (2+2)
    - c = 5 -> 2   (3+2)
    - c = 6 -> 2   (3+3)
    - c = 7 -> 3   (3+2+2)

    計算量: O(n)
    """
    freq = Counter(tasks)
    rounds = 0

    for c in freq.values():
        if c == 1:
            return -1
        rounds += (c + 2) // 3

    return rounds


if __name__ == "__main__":
    print(minimum_rounds([2, 2, 3, 3, 2, 4, 4, 4, 4, 4]))  # 4
    print(minimum_rounds([1, 1, 2, 2, 2, 3]))              # -1
    print(minimum_rounds([5, 5, 5, 5]))                    # 2
