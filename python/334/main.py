def zigzag_convert(s: str, numRows: int) -> str:
    if numRows == 1 or numRows >= len(s):
        return s

    rows = [[] for _ in range(numRows)]
    r = 0
    direction = 1  # 1: 下へ, -1: 上へ

    for ch in s:
        rows[r].append(ch)

        # 端に来たら向きを反転
        if r == 0:
            direction = 1
        elif r == numRows - 1:
            direction = -1

        r += direction

    return "".join("".join(row) for row in rows)


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("PAYPALISHIRING", 3),
        ("PAYPALISHIRING", 4),
        ("AB", 1),
    ]

    for i, (s, numRows) in enumerate(cases, start=1):
        print(f"例{i} 入力: s={s!r}, numRows={numRows}")
        print(f"例{i} 出力: {zigzag_convert(s, numRows)!r}")
        print("-" * 50)
