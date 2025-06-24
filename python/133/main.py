import re


def is_palindrome(s: str) -> bool:
    # 英数字のみを抽出し小文字に統一
    cleaned = re.sub(r"[^a-zA-Z0-9]", "", s).lower()
    # 前からと後ろからで同じかを判定
    return cleaned == cleaned[::-1]


# テスト
print(is_palindrome("A man, a plan, a canal: Panama"))  # 出力: True
print(is_palindrome("race a car"))  # 出力: False
print(is_palindrome(" "))  # 出力: True
