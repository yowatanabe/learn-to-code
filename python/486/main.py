def decode_log_pattern(pattern):
    stack = []
    current_string = ""
    current_number = 0

    for ch in pattern:
        if ch.isdigit():
            current_number = current_number * 10 + int(ch)

        elif ch == "[":
            stack.append((current_string, current_number))
            current_string = ""
            current_number = 0

        elif ch == "]":
            previous_string, repeat_count = stack.pop()
            current_string = previous_string + current_string * repeat_count

        else:
            current_string += ch

    return current_string


# 実行例
pattern1 = "3[ab]"
pattern2 = "2[a3[b]]"
pattern3 = "x2[yz]w"

print(decode_log_pattern(pattern1))  # ababab
print(decode_log_pattern(pattern2))  # abbbabbb
print(decode_log_pattern(pattern3))  # xyzyzw
