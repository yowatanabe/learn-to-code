def decode_string(s: str) -> str:
    num_stack = []
    str_stack = []
    curr_num = 0
    curr_str = []

    for ch in s:
        if ch.isdigit():
            curr_num = curr_num * 10 + int(ch)  # 多桁対応
        elif ch == "[":
            # 直前までの数値・文字列をスタックに退避
            num_stack.append(curr_num)
            str_stack.append("".join(curr_str))
            curr_num = 0
            curr_str = []
        elif ch == "]":
            # 直前のブロックを復元
            repeat = num_stack.pop()
            prev = str_stack.pop()
            curr_str = [prev + "".join(curr_str) * repeat]
        else:
            curr_str.append(ch)

    return "".join(curr_str)


# テスト
print(decode_string("3[a]2[bc]"))  # "aaabcbc"
print(decode_string("3[a2[c]]"))  # "accaccacc"
print(decode_string("2[ab3[c]]d"))  # "abcccabcccd"
print(decode_string("10[z]"))  # "zzzzzzzzzz"
