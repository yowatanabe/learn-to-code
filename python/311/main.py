from collections import Counter, defaultdict


def min_window(s: str, t: str) -> str:
    if not t or not s:
        return ""

    need = Counter(t)
    required = len(need)

    window = defaultdict(int)
    formed = 0

    left = 0
    best_len = float("inf")
    best_l = 0
    best_r = 0

    for right, ch in enumerate(s):
        window[ch] += 1

        # ある文字 ch が必要数ちょうどを満たした瞬間に formed を増やす
        if ch in need and window[ch] == need[ch]:
            formed += 1

        # 条件を満たしているなら、左端を詰めて最短を更新
        while formed == required and left <= right:
            if right - left + 1 < best_len:
                best_len = right - left + 1
                best_l, best_r = left, right

            # 左端を1つ縮める
            left_ch = s[left]
            window[left_ch] -= 1
            if left_ch in need and window[left_ch] < need[left_ch]:
                formed -= 1
            left += 1

    return "" if best_len == float("inf") else s[best_l : best_r + 1]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("ADOBECODEBANC", "ABC"),
        ("a", "a"),
        ("a", "aa"),
    ]

    for i, (s, t) in enumerate(cases, start=1):
        print(f"例{i} 入力: s={s!r}, t={t!r}")
        print(f"例{i} 出力: {min_window(s, t)!r}")
        print("-" * 40)
