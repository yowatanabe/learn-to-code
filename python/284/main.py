def length_of_longest_substring(s: str) -> int:
    """
    繰り返し文字を含まない最長部分文字列の長さを返す。
    スライディングウィンドウ + 直近位置の記録で O(n) で解く。
    """
    last_pos = {}  # 各文字の「最後に見たインデックス」
    left = 0  # 現在のウィンドウの左端
    ans = 0

    for right, ch in enumerate(s):
        # この文字 ch を以前見ていて、
        # その位置が現在のウィンドウ内にある場合、
        # left を「被りを解消できるところ」まで進める
        if ch in last_pos and last_pos[ch] >= left:
            left = last_pos[ch] + 1

        # ch の最新位置を更新
        last_pos[ch] = right

        # 現在のウィンドウ長を計算
        current_len = right - left + 1
        if current_len > ans:
            ans = current_len

    return ans


if __name__ == "__main__":
    # 実行例1
    s1 = "abcabcbb"
    print(length_of_longest_substring(s1))  # 3

    # 実行例2
    s2 = "bbbbb"
    print(length_of_longest_substring(s2))  # 1

    # 実行例3
    s3 = "pwwkew"
    print(length_of_longest_substring(s3))  # 3

    # 実行例4
    s4 = ""
    print(length_of_longest_substring(s4))  # 0
