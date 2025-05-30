def count_vowels(s):
    vowels = set("aeiou")
    return sum(1 for ch in s if ch in vowels)


# テスト
print(count_vowels("hello"))  # 2
print(count_vowels("python"))  # 1
print(count_vowels("sky"))  # 0
