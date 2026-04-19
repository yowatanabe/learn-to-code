def min_groups(files, maxSize):
    groups = 1
    current_sum = 0

    for size in files:
        # 今のグループに入れられるなら入れる
        if current_sum + size <= maxSize:
            current_sum += size
        else:
            # 新しいグループを作る
            groups += 1
            current_sum = size

    return groups


# 実行例
files1 = [4, 2, 3, 5, 1]
maxSize1 = 6

files2 = [1, 2, 3, 4]
maxSize2 = 10

files3 = [5, 5, 5, 5]
maxSize3 = 5

print(min_groups(files1, maxSize1))  # 3
print(min_groups(files2, maxSize2))  # 1
print(min_groups(files3, maxSize3))  # 4
