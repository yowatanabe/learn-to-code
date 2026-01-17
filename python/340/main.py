from typing import List, Dict
from collections import defaultdict, deque


def ladder_length(beginWord: str, endWord: str, wordList: List[str]) -> int:
    if endWord not in wordList:
        return 0

    L = len(beginWord)

    # パターン -> 単語リスト
    buckets: Dict[str, List[str]] = defaultdict(list)
    for w in wordList:
        for i in range(L):
            buckets[w[:i] + "*" + w[i + 1 :]].append(w)

    q = deque([(beginWord, 1)])  # (現在単語, 距離(単語数))
    visited = set([beginWord])

    while q:
        word, dist = q.popleft()
        if word == endWord:
            return dist

        for i in range(L):
            pat = word[:i] + "*" + word[i + 1 :]
            for nxt in buckets.get(pat, []):
                if nxt not in visited:
                    visited.add(nxt)
                    q.append((nxt, dist + 1))

            # 同じパターンを何度も走査しないようにクリア（重要）
            buckets[pat] = []

    return 0


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"], 5),
        ("hit", "cog", ["hot", "dot", "dog", "lot", "log"], 0),
        ("a", "c", ["a", "b", "c"], 2),
    ]

    for i, (beginWord, endWord, wordList, expected) in enumerate(cases, start=1):
        got = ladder_length(beginWord, endWord, wordList)
        print(
            f"例{i} 入力: beginWord={beginWord!r}, endWord={endWord!r}, wordList={wordList}"
        )
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
