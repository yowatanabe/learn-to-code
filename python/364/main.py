from typing import Dict
from collections import Counter, defaultdict

def min_window(s: str, t: str) -> str:
    if not t or not s:
        return ""

    need = Counter(t)                 # 必要な文字の回数
    missing_types = len(need)         # まだ満たしていない文字種の数
    have: Dict[str, int] = defaultdict(int)

    best_len = 10**18
    best_l = 0

    left = 0
    for right, ch in enumerate(s):
        # 右を伸ばす
        if ch in need:
            have[ch] += 1
            if have[ch] == need[ch]:
                missing_types -= 1

        # 全て満たしたら、左を詰めて最短化
        while missing_types == 0:
            window_len = right - left + 1
            if window_len < best_len:
                best_len = window_len
                best_l = left

            # 左を1つ縮める
            left_ch = s[left]
            if left_ch in need:
                have[left_ch] -= 1
                if have[left_ch] < need[left_ch]:
                    missing_types += 1
            left += 1

    if best_len == 10**18:
        return ""
    return s[best_l: best_l + best_len]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("ADOBECODEBANC", "ABC", "BANC"),
        ("a", "a", "a"),
        ("a", "aa", ""),
        ("aaabdabcefaecbef", "abc", "abc"),
    ]

    for i, (s, t, expected) in enumerate(cases, start=1):
        got = min_window(s, t)
        print(f"例{i} 入力: s={s!r}, t={t!r}")
        print(f"例{i} 出力: {got!r} (期待値: {expected!r})")
        print("-" * 60)
