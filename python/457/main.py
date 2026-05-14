def min_remove_to_valid_parentheses(s):
    open_count = 0
    remove_count = 0

    for ch in s:
        if ch == "(":
            open_count += 1
        elif ch == ")":
            if open_count > 0:
                open_count -= 1
            else:
                remove_count += 1

    return remove_count + open_count


# 実行例
s1 = "a)b(c)d"
s2 = "))(("
s3 = "(log(error))"

print(min_remove_to_valid_parentheses(s1))  # 1
print(min_remove_to_valid_parentheses(s2))  # 4
print(min_remove_to_valid_parentheses(s3))  # 0
