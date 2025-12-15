MOD = 10**9 + 7


def ways1(c: str) -> int:
    """1文字 c の復号通り数"""
    if c == "*":
        return 9  # '1'..'9'
    if c == "0":
        return 0
    return 1  # '1'..'9'


def ways2(a: str, b: str) -> int:
    """2文字 ab の復号通り数（10..26 の範囲）"""
    # a と b の組み合わせを場合分け
    if a == "*" and b == "*":
        # 11..19 (9通り) + 21..26 (6通り) = 15
        return 15
    if a == "*":
        # b が数字
        if b == "0":
            # 10 or 20
            return 2
        if "1" <= b <= "6":
            # 1b or 2b
            return 2
        # 7..9 は 1b のみ
        return 1
    if b == "*":
        # a が数字
        if a == "1":
            # 11..19
            return 9
        if a == "2":
            # 21..26
            return 6
        return 0
    # 両方数字
    val = (ord(a) - 48) * 10 + (ord(b) - 48)
    return 1 if 10 <= val <= 26 else 0


def num_decodings_star(s: str) -> int:
    """
    '*' を含む decode ways を MOD で返す。
    O(n) 時間 / O(1) 追加メモリ。
    """
    n = len(s)
    if n == 0:
        return 0

    # dp0 = dp[i-2], dp1 = dp[i-1]
    dp0 = 1
    dp1 = ways1(s[0])
    if dp1 == 0:
        return 0

    for i in range(2, n + 1):
        c1 = s[i - 1]
        c0 = s[i - 2]

        cur = (ways1(c1) * dp1 + ways2(c0, c1) * dp0) % MOD
        dp0, dp1 = dp1, cur

    return dp1


if __name__ == "__main__":
    test_cases = [
        "*",
        "1*",
        "*0",
        "0*",
    ]

    for s in test_cases:
        result = num_decodings_star(s)
        print("-" * 30)
        print(f"入力: {s}")
        print(f"出力: {result}")
