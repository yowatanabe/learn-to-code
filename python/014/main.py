t = (1, 4, 6, 2, 9)


def answer1(t):
    return f"{t}の逆順のタプルは{tuple(reversed(t))}です。"


def answer2(t):
    return f"{t}の逆順のタプルは{t[::-1]}です。"


print(answer1(t))
print(answer2(t))
