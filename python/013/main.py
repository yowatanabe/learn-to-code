t = (2, 5, 8, 11, 6, 13)


def answer(t):
    odd_numbers = [n for n in t if n % 2 == 1]
    return f"{t}の奇数の要素は{', '.join(map(str, odd_numbers))}です。"


print(answer(t))
