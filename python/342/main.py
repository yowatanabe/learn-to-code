def compress_string(s: str) -> str:
    if not s:
        return ""

    out = []
    cur = s[0]
    cnt = 1

    for i in range(1, len(s)):
        if s[i] == cur:
            cnt += 1
        else:
            out.append(cur)
            if cnt > 1:
                out.append(str(cnt))
            cur = s[i]
            cnt = 1

    # 最後の塊を追加
    out.append(cur)
    if cnt > 1:
        out.append(str(cnt))

    return "".join(out)


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("aaabccdddd", "a3bc2d4"),
        ("abcd", "abcd"),
        ("zzzzzz", "z6"),
    ]

    for i, (s, expected) in enumerate(cases, start=1):
        got = compress_string(s)
        print(f"例{i} 入力: s={s!r}")
        print(f"例{i} 出力: {got!r} (期待値: {expected!r})")
        print("-" * 50)
