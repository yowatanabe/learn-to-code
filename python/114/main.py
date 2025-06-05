def is_valid_parentheses(s):
    count = 0
    for char in s:
        if char == "(":
            count += 1
        elif char == ")":
            count -= 1
            if count < 0:
                return False
    return count == 0


# テスト
print(is_valid_parentheses("()"))  # True
print(is_valid_parentheses("(()())"))  # True
print(is_valid_parentheses("())("))  # False
print(is_valid_parentheses("("))  # False
