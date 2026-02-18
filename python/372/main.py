def check_valid_string(s: str) -> bool:
    low = 0   # 最小の '(' 残数
    high = 0  # 最大の '(' 残数

    for ch in s:
        if ch == '(':
            low += 1
            high += 1
        elif ch == ')':
            low -= 1
            high -= 1
        else:  # '*'
            # '*' を ')' にすると low が減る
            # '*' を '(' にすると high が増える
            low -= 1
            high += 1

        if high < 0:
            return False  # ')' が多すぎ

        if low < 0:
            low = 0

    return low == 0


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("()", True),
        ("(*)", True),
        ("(*))", True),
        (")*(", False),
    ]

    for i, (s, expected) in enumerate(cases, start=1):
        got = check_valid_string(s)
        print(f"例{i} 入力: s={s!r}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
