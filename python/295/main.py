def longest_palindrome(s: str) -> str:
    """
    文字列 s の最長回文部分文字列を返す。
    各位置を「中心」とみなして左右に広げる O(n^2) 解法。
    """

    # 長さ1以下はそのまま返せばOK
    if len(s) <= 1:
        return s

    # 回文を中心から左右に広げて、最長の [start, end) を返すヘルパー
    def expand_from_center(left: int, right: int) -> tuple[int, int]:
        # s[left] と s[right] が等しい限り、外側に広げていく
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        # ループを抜けたとき、left と right は「1個外」に出てしまっているので、
        # 実際の回文の範囲は (left+1, right) になる
        return left + 1, right

    best_start, best_end = (
        0,
        1,
    )  # 少なくとも1文字はあるので、最初は s[0:1] を最長としておく

    for i in range(len(s)):
        # 奇数長の回文: 中心が1文字 (i)
        start1, end1 = expand_from_center(i, i)

        # 偶数長の回文: 中心が2文字の間 (i, i+1)
        start2, end2 = expand_from_center(i, i + 1)

        # どちらが長いか比べて、より長い方を採用
        if end1 - start1 > best_end - best_start:
            best_start, best_end = start1, end1
        if end2 - start2 > best_end - best_start:
            best_start, best_end = start2, end2

    # 最長回文部分文字列を返す
    return s[best_start:best_end]


if __name__ == "__main__":
    # 実行例1
    s1 = "babad"
    print("例1の入力:", s1)
    print("例1の結果:", longest_palindrome(s1))  # "bab" または "aba"

    # 実行例2
    s2 = "cbbd"
    print("例2の入力:", s2)
    print("例2の結果:", longest_palindrome(s2))  # "bb"

    # 実行例3
    s3 = "a"
    print("例3の入力:", s3)
    print("例3の結果:", longest_palindrome(s3))  # "a"

    # 実行例4
    s4 = "ac"
    print("例4の入力:", s4)
    print("例4の結果:", longest_palindrome(s4))  # "a" または "c"
