from typing import List
from collections import defaultdict

def shortest_cover_all_types(events: List[int]) -> int:
    """
    配列全体に存在する全種類の値を含む最短部分配列を求める。

    方針:
    - まず全種類数 need を求める
    - スライディングウィンドウで右端を広げながら種類数を満たすまで進む
    - 条件を満たしたら左端をできるだけ縮めて最短を更新する

    計算量: O(n)
    """
    need = len(set(events))
    count = defaultdict(int)

    left = 0
    formed = 0
    answer = len(events)

    for right, value in enumerate(events):
        count[value] += 1
        if count[value] == 1:
            formed += 1

        while formed == need:
            answer = min(answer, right - left + 1)

            left_value = events[left]
            count[left_value] -= 1
            if count[left_value] == 0:
                formed -= 1
            left += 1

    return answer


if __name__ == "__main__":
    print(shortest_cover_all_types([1, 2, 2, 3, 1]))              # 3
    print(shortest_cover_all_types([5, 5, 5, 5]))                 # 1
    print(shortest_cover_all_types([7, 1, 3, 7, 3, 1, 4, 1, 4]))  # 4
