from typing import List
from collections import Counter


def top_k_frequent_words(words: List[str], k: int) -> List[str]:
    freq = Counter(words)
    # (-回数, 単語) でソートすれば、回数降順 & 辞書順昇順になる
    items = sorted(freq.items(), key=lambda x: (-x[1], x[0]))
    return [w for w, _ in items[:k]]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (["i", "love", "leetcode", "i", "love", "coding"], 2),
        (["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4),
    ]

    for i, (words, k) in enumerate(cases, start=1):
        print(f"例{i} 入力: words={words}, k={k}")
        print(f"例{i} 出力: {top_k_frequent_words(words, k)}")
        print("-" * 40)
