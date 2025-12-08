from typing import List


def word_break(s: str, wordDict: List[str]) -> bool:
    """
    文字列 s が wordDict の単語の連結で表せるかどうかを判定する。
    DP を用いて O(n^2) で解く。
    """
    n = len(s)
    word_set = set(wordDict)  # O(1) で含まれているか判定するためにセット化
    dp = [False] * (n + 1)
    dp[0] = True  # 空文字は「分割済み」とみなす

    # i は「先頭から i 文字目まで」を表す
    for i in range(1, n + 1):
        # j で「最後の単語の開始位置」を試す
        for j in range(i):
            # s[:j] が分割可能で、かつ s[j:i] が辞書にあれば OK
            if dp[j] and s[j:i] in word_set:
                dp[i] = True
                break  # i までが分割可能と分かったので、これ以上の j を試す必要はない

    return dp[n]


if __name__ == "__main__":
    # 実行例1
    s1 = "leetcode"
    wordDict1 = ["leet", "code"]
    print("例1の入力:", s1, wordDict1)
    print("例1の結果:", word_break(s1, wordDict1))  # True

    # 実行例2
    s2 = "applepenapple"
    wordDict2 = ["apple", "pen"]
    print("例2の入力:", s2, wordDict2)
    print("例2の結果:", word_break(s2, wordDict2))  # True

    # 実行例3
    s3 = "catsandog"
    wordDict3 = ["cats", "dog", "sand", "and", "cat"]
    print("例3の入力:", s3, wordDict3)
    print("例3の結果:", word_break(s3, wordDict3))  # False

    # 実行例4
    s4 = "aaaaaaa"
    wordDict4 = ["aaaa", "aaa"]
    print("例4の入力:", s4, wordDict4)
    print("例4の結果:", word_break(s4, wordDict4))  # True
