def decode_string(s: str) -> str:
    """
    スタックを使ってデコードする典型問題。

    方針:
    - 数字を読んで繰り返し回数を作る
    - '[' が来たら、現在までの文字列と回数をスタックに積む
    - ']' が来たら、直前の文字列を取り出して
      current_string * repeat_count を結合する
    - 通常の文字は current_string に追加する

    計算量: O(n + 出力長)
    """
    stack = []  # (直前までの文字列, 繰り返し回数)
    current_num = 0
    current_str = ""

    for ch in s:
        if ch.isdigit():
            current_num = current_num * 10 + int(ch)
        elif ch == "[":
            stack.append((current_str, current_num))
            current_str = ""
            current_num = 0
        elif ch == "]":
            prev_str, repeat = stack.pop()
            current_str = prev_str + current_str * repeat
        else:
            current_str += ch

    return current_str


if __name__ == "__main__":
    print(decode_string("3[a]2[bc]"))      # aaabcbc
    print(decode_string("3[a2[c]]"))       # accaccacc
    print(decode_string("2[abc]3[cd]ef"))  # abcabccdcdcdef
