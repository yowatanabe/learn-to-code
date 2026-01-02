def longest_palindrome(s: str) -> str:
    if not s:
        return ""

    def expand_around_center(left: int, right: int) -> str:
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        return s[left + 1 : right]

    longest = ""
    for i in range(len(s)):
        # 奇数長の回文を探す
        odd_palindrome = expand_around_center(i, i)
        # 偶数長の回文を探す
        even_palindrome = expand_around_center(i, i + 1)

        # 最長の回文を更新
        longest = max(longest, odd_palindrome, even_palindrome, key=len)

    return longest


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("babad",),
        ("cbbd",),
        ("a",),
        ("ac",),
    ]

    for i, (s,) in enumerate(cases, start=1):
        print(f"例{i} 入力: s={s!r}")
        print(f"例{i} 出力: {longest_palindrome(s)}")
        print("-" * 40)
