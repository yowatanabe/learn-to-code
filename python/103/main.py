def is_palindrome(s):
    return s == s[::-1]


# テスト
print(is_palindrome("racecar"))  # True
print(is_palindrome("hello"))  # False
print(is_palindrome("level"))  # True
