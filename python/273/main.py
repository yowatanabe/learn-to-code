from typing import List


def find_anagram_start_indices(s: str, p: str) -> List[int]:
    """
    文字列 s の中で、p のアナグラムが現れる開始インデックスをすべて返す。

    アルゴリズム:
      - p の文字ごとのカウント配列 need[26] を作る
      - s 上を長さ len(p) のウィンドウで動かしてカウント配列 win[26] を管理
      - 各位置で need == win なら、その開始位置を答えに追加
      - 文字種が26個と固定なので、比較は O(26) = 定数時間

    時間計算量: O(len(s) + len(p))
    追加メモリ: O(1) (配列サイズ26固定)
    """
    n, m = len(s), len(p)
    if m > n:
        return []

    # 'a'〜'z' を 0〜25 にマッピング
    def idx(c: str) -> int:
        return ord(c) - ord("a")

    need = [0] * 26
    win = [0] * 26

    for ch in p:
        need[idx(ch)] += 1

    # 最初のウィンドウ [0, m)
    for i in range(m):
        win[idx(s[i])] += 1

    res: List[int] = []
    if win == need:
        res.append(0)

    # ウィンドウを右に1ずつずらしていく
    for start in range(1, n - m + 1):
        # 前のウィンドウの先頭文字を削除
        left_ch = s[start - 1]
        win[idx(left_ch)] -= 1

        # 新たに右端に入る文字を追加
        right_ch = s[start + m - 1]
        win[idx(right_ch)] += 1

        if win == need:
            res.append(start)

    return res


# 動作確認用の print（要求どおりprintで結果を出すパート）
if __name__ == "__main__":
    # 例1
    s1 = "cbaebabacd"
    p1 = "abc"
    print(find_anagram_start_indices(s1, p1))  # [0, 6]

    # 例2
    s2 = "abab"
    p2 = "ab"
    print(find_anagram_start_indices(s2, p2))  # [0, 1, 2]

    # 例3
    s3 = "aaaaa"
    p3 = "aa"
    print(find_anagram_start_indices(s3, p3))  # [0, 1, 2, 3]

    # 例4
    s4 = "abc"
    p4 = "abcd"
    print(find_anagram_start_indices(s4, p4))  # []
