def make_valid_query(query):
    stack = []
    remove_indexes = set()

    for i, ch in enumerate(query):
        if ch == "(":
            stack.append(i)
        elif ch == ")":
            if stack:
                stack.pop()
            else:
                remove_indexes.add(i)

    # 対応する ")" がなかった "(" も削除対象
    for i in stack:
        remove_indexes.add(i)

    result = []

    for i, ch in enumerate(query):
        if i not in remove_indexes:
            result.append(ch)

    return "".join(result)


# 実行例
query1 = "a)b(c)d"
query2 = "((log)"
query3 = "api))("

print(make_valid_query(query1))  # ab(c)d
print(make_valid_query(query2))  # (log)
print(make_valid_query(query3))  # api
