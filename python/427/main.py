from collections import deque


def min_transform_steps(beginWord, endWord, wordList):
    word_set = set(wordList)

    if endWord not in word_set:
        return 0

    queue = deque([(beginWord, 0)])
    visited = set([beginWord])

    while queue:
        current_word, steps = queue.popleft()

        if current_word == endWord:
            return steps

        for i in range(len(current_word)):
            for ch in "abcdefghijklmnopqrstuvwxyz":
                if ch == current_word[i]:
                    continue

                next_word = current_word[:i] + ch + current_word[i + 1:]

                if next_word in word_set and next_word not in visited:
                    visited.add(next_word)
                    queue.append((next_word, steps + 1))

    return 0


# 実行例
beginWord1 = "hit"
endWord1 = "cog"
wordList1 = ["hot", "dot", "dog", "lot", "log", "cog"]

beginWord2 = "hit"
endWord2 = "cog"
wordList2 = ["hot", "dot", "dog", "lot", "log"]

beginWord3 = "cat"
endWord3 = "dog"
wordList3 = ["cot", "cog", "dot", "dog"]

print(min_transform_steps(beginWord1, endWord1, wordList1))  # 4
print(min_transform_steps(beginWord2, endWord2, wordList2))  # 0
print(min_transform_steps(beginWord3, endWord3, wordList3))  # 3
