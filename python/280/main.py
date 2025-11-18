from typing import List


def longest_consecutive_days(days: List[int]) -> int:
    """
    値として連続する日付IDの最長長さを O(n) で求める。

    アルゴリズム:
      1. days を set に入れて重複を消しつつ、O(1) で存在確認できるようにする。
      2. 各 day について、
         - 「day - 1 が set に存在しない」なら、day は連続区間の先頭になりうる。
         - そこから day+1, day+2, ... と set に存在する限りカウントを伸ばす。
      3. 各連続区間の長さの最大値を答えとする。
      4. 連続区間の先頭からしかループを始めないので、全体の計算量は平均 O(n)。

    直感:
      - 連続区間を何度も数えないように、
        「先頭候補 day のときだけ while で右に伸ばす」ようにしている。
    """
    if not days:
        return 0

    # 値の存在チェック用セット（重複も自然に削除される）
    day_set = set(days)

    longest = 0

    for day in day_set:
        # day - 1 が無い場合のみ、day を連続区間の先頭とみなす
        if day - 1 not in day_set:
            current = day
            length = 1

            # day, day+1, day+2, ... と連続している間カウント
            while current + 1 in day_set:
                current += 1
                length += 1

            if length > longest:
                longest = length

    return longest


# 要求どおり print で結果をアウトプットする部分
if __name__ == "__main__":
    # 例1
    days1 = [100, 4, 200, 1, 3, 2]
    print(longest_consecutive_days(days1))  # 4

    # 例2
    days2 = [10, 5, 12, 3, 55, 11, 4, 13]
    print(longest_consecutive_days(days2))  # 4

    # 例3
    days3 = [1, 2, 2, 3]
    print(longest_consecutive_days(days3))  # 3

    # 例4
    days4: List[int] = []
    print(longest_consecutive_days(days4))  # 0

    # 例5
    days5 = [7, 7, 7]
    print(longest_consecutive_days(days5))  # 1
