from typing import List

def min_cut_palindrome_partition(s: str) -> int:
    n = len(s)
    if n <= 1:
        return 0

    # pal[i][j] を前計算
    pal: List[List[bool]] = [[False] * n for _ in range(n)]
    for i in range(n):
        pal[i][i] = True

    # 長さ2以上を埋める
    for length in range(2, n + 1):
        for i in range(0, n - length + 1):
            j = i + length - 1
            if s[i] == s[j]:
                if length == 2:
                    pal[i][j] = True
                else:
                    pal[i][j] = pal[i + 1][j - 1]

    # dp
    dp = [0] * n
    for i in range(n):
        if pal[0][i]:
            dp[i] = 0
        else:
            best = 10**9
            for j in range(1, i + 1):
                if pal[j][i]:
                    best = min(best, dp[j - 1] + 1)
            dp[i] = best

    return dp[n - 1]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("aab", 1),
        ("a", 0),
        ("abccbc", 2),
    ]

    for i, (s, expected) in enumerate(cases, start=1):
        got = min_cut_palindrome_partition(s)
        print(f"例{i} 入力: s={s!r}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
