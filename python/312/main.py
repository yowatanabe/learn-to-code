def decode_string(s: str) -> str:
    """
    エンコード文字列 s をデコードして返す。
    スタックで O(n)。
    """
    stack = []  # (prev_string, repeat_count)
    cur = []  # 現在構築中の文字列（listで効率化）
    num = 0

    for ch in s:
        if ch.isdigit():
            # k が複数桁の可能性があるので num = num*10 + digit
            num = num * 10 + (ord(ch) - ord("0"))
        elif ch == "[":
            # 現在の文字列と繰り返し回数を退避
            stack.append(("".join(cur), num))
            # 新しいブロックへ
            cur = []
            num = 0
        elif ch == "]":
            prev, k = stack.pop()
            cur = [prev + ("".join(cur) * k)]
        else:
            # 通常の文字
            cur.append(ch)

    return "".join(cur)


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        "3[a]2[bc]",
        "3[a2[c]]",
        "2[abc]3[cd]ef",
    ]

    for i, s in enumerate(cases, start=1):
        print(f"例{i} 入力: {s!r}")
        print(f"例{i} 出力: {decode_string(s)!r}")
        print("-" * 40)
