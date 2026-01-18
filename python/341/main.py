from typing import Dict
from collections import Counter, defaultdict


def min_window(s: str, t: str) -> str:
    if not t or not s:
        return ""

    need = Counter(t)
    missing_types = len(need)  # まだ満たしていない文字種数

    window: Dict[str, int] = defaultdict(int)
    left = 0

    best_len = float("inf")
    best_l = 0

    for right, ch in enumerate(s):
        window[ch] += 1

        if ch in need and window[ch] == need[ch]:
            missing_types -= 1

        # すべて満たしたら左を詰める
        while missing_types == 0:
            cur_len = right - left + 1
            if cur_len < best_len:
                best_len = cur_len
                best_l = left

            left_ch = s[left]
            window[left_ch] -= 1
            if left_ch in need and window[left_ch] < need[left_ch]:
                missing_types += 1
            left += 1

    return "" if best_len == float("inf") else s[best_l : best_l + best_len]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("ADOBECODEBANC", "ABC", "BANC"),
        ("a", "a", "a"),
        ("a", "aa", ""),
    ]

    for i, (s, t, expected) in enumerate(cases, start=1):
        got = min_window(s, t)
        print(f"例{i} 入力: s={s!r}, t={t!r}")
        print(f"例{i} 出力: {got!r} (期待値: {expected!r})")
        print("-" * 60)
