from typing import Dict
from collections import defaultdict


def character_replacement(s: str, k: int) -> int:
    freq: Dict[str, int] = defaultdict(int)
    left = 0
    max_freq = 0
    best = 0

    for right, ch in enumerate(s):
        freq[ch] += 1
        max_freq = max(max_freq, freq[ch])

        # 置換回数が k を超えるなら縮める
        while (right - left + 1) - max_freq > k:
            freq[s[left]] -= 1
            left += 1

        best = max(best, right - left + 1)

    return best


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("ABAB", 2, 4),
        ("AABABBA", 1, 4),
        ("AAAA", 0, 4),
    ]

    for i, (s, k, expected) in enumerate(cases, start=1):
        got = character_replacement(s, k)
        print(f"例{i} 入力: s={s!r}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
