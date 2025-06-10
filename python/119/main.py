def is_valid_parentheses(s: str) -> bool:
    count = 0
    for ch in s:
        if ch == "(":
            count += 1
        else:
            count -= 1
        if count < 0:
            return False
    return count == 0


# テスト
print(is_valid_parentheses("()"))  # 出力: True
print(is_valid_parentheses("(()())"))  # 出力: True
print(is_valid_parentheses("(()"))  # 出力: False
print(is_valid_parentheses("())("))  # 出力: False
