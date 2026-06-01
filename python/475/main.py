def is_subsequence(source, target):
    i = 0  # target の位置

    for ch in source:
        if i < len(target) and ch == target[i]:
            i += 1

        if i == len(target):
            return True

    return i == len(target)


# 実行例
source1 = "deployrollback"
target1 = "debug"

source2 = "database"
target2 = "data"

source3 = "incident"
target3 = "ice"

print(is_subsequence(source1, target1))  # False
print(is_subsequence(source2, target2))  # True
print(is_subsequence(source3, target3))  # True
