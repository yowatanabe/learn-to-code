t = (9, 12, 5, 18, 7, 6)


def answer1(t):
    t2 = []
    for x in t:
        if x % 3 == 0:
            t2.append(x)
    return f"{t}から3で割り切れる要素だけを含むタプルは{tuple(t2)}です。"


def answer2(t):
    t2 = tuple([x for x in t if x % 3 == 0])
    return f"{t}から3で割り切れる要素だけを含むタプルは{t2}です。"


print(answer1(t))
print(answer2(t))
