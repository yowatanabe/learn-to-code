from typing import List


def find_anagrams(s: str, p: str) -> List[int]:
    n, m = len(s), len(p)
    if m > n:
        return []

    def idx(ch: str) -> int:
        return ord(ch) - ord("a")

    need = [0] * 26
    window = [0] * 26

    for ch in p:
        need[idx(ch)] += 1

    # 最初のウィンドウ
    for ch in s[:m]:
        window[idx(ch)] += 1

    res = []
    if window == need:
        res.append(0)

    # ウィンドウを右に1つずつずらす
    for i in range(m, n):
        window[idx(s[i])] += 1  # 右端を追加
        window[idx(s[i - m])] -= 1  # 左端を削除

        if window == need:
            res.append(i - m + 1)

    return res


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("cbaebabacd", "abc"),
        ("abab", "ab"),
        ("aaaaa", "b"),
    ]

    for i, (s, p) in enumerate(cases, start=1):
        print(f"例{i} 入力: s={s!r}, p={p!r}")
        print(f"例{i} 出力: {find_anagrams(s, p)}")
        print("-" * 40)
