def longest_ones_after_one_change(status):
    left = 0
    zero_count = 0
    answer = 0

    for right in range(len(status)):
        if status[right] == "0":
            zero_count += 1

        while zero_count > 1:
            if status[left] == "0":
                zero_count -= 1
            left += 1

        answer = max(answer, right - left + 1)

    # 1つ変更対象として扱うため、最終的に1文字分を引く
    return answer - 1


# 実行例
status1 = "110111"
status2 = "10110"
status3 = "1111"

print(longest_ones_after_one_change(status1))  # 5
print(longest_ones_after_one_change(status2))  # 4
print(longest_ones_after_one_change(status3))  # 3
