def removeDuplicates(s: str) -> str:
    stack = []
    for char in s:
        if stack and stack[-1] == char:
            stack.pop()
        else:
            stack.append(char)
    return "".join(stack)


# テスト
print(removeDuplicates("abbaca"))  # 出力: "ca"
print(removeDuplicates("azxxzy"))  # 出力: "ay"
