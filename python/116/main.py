import re


def is_palindrome(s: str) -> bool:
    # 英数字だけを抽出し、小文字に変換
    cleaned = re.sub(r"[^a-zA-Z0-9]", "", s).lower()
    return cleaned == cleaned[::-1]


# テスト
print(is_palindrome("A man, a plan, a canal: Panama"))  # True
print(is_palindrome("race a car"))  # False
print(is_palindrome(" "))  # True
