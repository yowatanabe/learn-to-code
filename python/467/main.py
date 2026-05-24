def min_suffix_flips_to_normal(status):
    flips = 0
    current = "0"

    for ch in status:
        # flips 回反転した後に期待している見え方と違うなら、
        # ここから末尾まで反転する必要がある
        if ch != current:
            flips += 1
            current = ch

    return flips


# 実行例
status1 = "10111"
status2 = "0000"
status3 = "010"

print(min_suffix_flips_to_normal(status1))  # 3
print(min_suffix_flips_to_normal(status2))  # 0
print(min_suffix_flips_to_normal(status3))  # 2
