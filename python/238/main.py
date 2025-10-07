def length_of_longest_substring(s: str) -> int:
    """
    スライディングウィンドウ + 直近位置の記録。
    left..right のウィンドウで、重複文字が出たら
    left をその文字の直近位置+1 までジャンプ。
    時間 O(n), 追加メモリ O(min(n, |Σ|))
    """
    last = {}  # 文字 -> 直近の出現インデックス
    left = 0
    best = 0

    for right, ch in enumerate(s):
        if ch in last and last[ch] >= left:
            left = last[ch] + 1
        last[ch] = right
        best = max(best, right - left + 1)

    return best


# テスト
print(length_of_longest_substring("abcabcbb"))  # 3
print(length_of_longest_substring("bbbbb"))  # 1
print(length_of_longest_substring("pwwkew"))  # 3
print(length_of_longest_substring(""))  # 0
