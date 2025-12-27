from typing import List


def multiply_strings(num1: str, num2: str) -> str:
    if num1 == "0" or num2 == "0":
        return "0"

    n, m = len(num1), len(num2)
    res = [0] * (n + m)

    # 下位桁から掛け算（筆算）
    for i in range(n - 1, -1, -1):
        a = ord(num1[i]) - ord("0")
        for j in range(m - 1, -1, -1):
            b = ord(num2[j]) - ord("0")
            res[i + j + 1] += a * b

    # 繰り上がり処理
    for k in range(n + m - 1, 0, -1):
        carry = res[k] // 10
        res[k] %= 10
        res[k - 1] += carry

    # 先頭の 0 をスキップして文字列化
    start = 0
    while start < len(res) and res[start] == 0:
        start += 1

    return "".join(str(d) for d in res[start:]) if start < len(res) else "0"


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("2", "3"),
        ("123", "456"),
        ("0", "999"),
        ("999", "999"),
    ]

    for i, (a, b) in enumerate(cases, start=1):
        print(f"例{i} 入力: num1={a!r}, num2={b!r}")
        print(f"例{i} 出力: {multiply_strings(a, b)!r}")
        print("-" * 40)
