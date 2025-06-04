def count_words(s):
    if not s:
        return {}
    words = s.split()
    word_count = {}
    for word in words:
        word_count[word] = word_count.get(word, 0) + 1
    return word_count


# テスト
print(count_words("apple banana apple"))  # {'apple': 2, 'banana': 1}
print(count_words("Hello hello HELLO"))  # {'Hello': 1, 'hello': 1, 'HELLO': 1}
print(count_words(""))  # {}
