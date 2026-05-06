from bisect import bisect_left


def min_deletions_to_increasing(levels):
    tails = []

    for level in levels:
        pos = bisect_left(tails, level)

        if pos == len(tails):
            tails.append(level)
        else:
            tails[pos] = level

    longest_increasing_length = len(tails)
    return len(levels) - longest_increasing_length


# 実行例
levels1 = [5, 1, 6, 2, 3, 4]
levels2 = [1, 2, 3, 4]
levels3 = [4, 3, 2, 1]

print(min_deletions_to_increasing(levels1))  # 2
print(min_deletions_to_increasing(levels2))  # 0
print(min_deletions_to_increasing(levels3))  # 3
