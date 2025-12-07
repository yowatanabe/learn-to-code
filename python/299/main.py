def num_decodings(s: str) -> int:
    """
    数字文字列 s をデコードできる通り数を返す。
    DP を用いて O(n) で解く。
    """
    n = len(s)
    if n == 0:
        return 0

    # 先頭が '0' ならそもそも不可能
    if s[0] == "0":
        return 0

    # dp[i]: s[:i] のデコード通り数（i文字目まで）
    dp = [0] * (n + 1)
    dp[0] = 1  # 空文字のデコード通り数は 1 として扱う
    dp[1] = 1  # s[0] が '0' ではないことはチェック済みなので 1

    for i in range(2, n + 1):
        # 1文字解釈: s[i-1]
        one = s[i - 1]
        if "1" <= one <= "9":
            dp[i] += dp[i - 1]

        # 2文字解釈: s[i-2:i]
        two = s[i - 2 : i]
        if "10" <= two <= "26":
            dp[i] += dp[i - 2]

    return dp[n]


if __name__ == "__main__":
    # 実行例1
    s1 = "12"
    print("例1の入力:", s1)
    print("例1の結果:", num_decodings(s1))  # 2

    # 実行例2
    s2 = "226"
    print("例2の入力:", s2)
    print("例2の結果:", num_decodings(s2))  # 3

    # 実行例3
    s3 = "06"
    print("例3の入力:", s3)
    print("例3の結果:", num_decodings(s3))  # 0

    # 実行例4
    s4 = "11106"
    print("例4の入力:", s4)
    print("例4の結果:", num_decodings(s4))  # 2
