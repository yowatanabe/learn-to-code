def length_of_longest_substring(s: str) -> int:
    last = {}  # 文字 -> 最後に出現したインデックス
    left = 0
    best = 0

    for right, ch in enumerate(s):
        # ch がウィンドウ内にいたなら、left を更新
        if ch in last and last[ch] >= left:
            left = last[ch] + 1

        last[ch] = right
        best = max(best, right - left + 1)

    return best


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        "abcabcbb",
        "bbbbb",
        "pwwkew",
        "",
    ]

    for i, s in enumerate(cases, start=1):
        print(f"例{i} 入力: {s!r}")
        print(f"例{i} 出力: {length_of_longest_substring(s)}")
        print("-" * 40)
