from typing import List


def word_break(s: str, wordDict: List[str]) -> bool:
    word_set = set(wordDict)
    n = len(s)
    # 探索を早くするため、辞書中の最大単語長だけ試す
    max_len = max((len(w) for w in word_set), default=0)

    # dp[i] = s[:i] を辞書で構成できるか
    dp = [False] * (n + 1)
    dp[0] = True  # 空文字は構成可能

    for i in range(1, n + 1):
        # 直近 max_len 文字だけを見る（境界に注意）
        start = max(0, i - max_len)
        # j を後ろから前へ動かすと、早めに True に到達しやすい
        for j in range(i - 1, start - 1, -1):
            if dp[j] and s[j:i] in word_set:
                dp[i] = True
                break

    return dp[n]


# テスト
print(word_break("leetcode", ["leet", "code"]))  # True
print(word_break("applepenapple", ["apple", "pen"]))  # True
print(word_break("catsandog", ["cats", "dog", "sand", "and", "cat"]))  # False
print(word_break("aaaaaaa", ["aaaa", "aaa"]))  # True
