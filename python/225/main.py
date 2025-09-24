def longest_palindrome(s: str) -> str:
    """
    中心展開法: 各位置（文字間も含む）を中心に左右へ広げて最長回文を更新。
    O(n^2) 時間, O(1) 追加メモリ。最長が複数なら左側を優先（<= の比較で更新）。
    """
    n = len(s)
    if n <= 1:
        return s

    def expand(l: int, r: int) -> tuple[int, int]:
        while l >= 0 and r < n and s[l] == s[r]:
            l -= 1
            r += 1
        # 1つ外へ出ているので、実際の回文範囲は (l+1, r-1)
        return l + 1, r - 1

    best_l = best_r = 0

    for i in range(n):
        # 奇数長中心 (i,i)
        l1, r1 = expand(i, i)
        if r1 - l1 > best_r - best_l:
            best_l, best_r = l1, r1

        # 偶数長中心 (i,i+1)
        if i + 1 < n:
            l2, r2 = expand(i, i + 1)
            # 同長なら左を優先したいので、厳密に長さが大きいときのみ更新
            if r2 - l2 > best_r - best_l:
                best_l, best_r = l2, r2

    return s[best_l : best_r + 1]


# テスト
print(longest_palindrome("babad"))  # "bab" もしくは "aba"（本実装は "bab"）
print(longest_palindrome("cbbd"))  # "bb"
print(longest_palindrome("a"))  # "a"
print(longest_palindrome("forgeeksskeegfor"))  # "geeksskeeg"
