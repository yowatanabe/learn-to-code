def days_until_higher_usage(usages):
    n = len(usages)
    answer = [0] * n
    stack = []  # usage がまだ未解決の日の index を入れる

    for i in range(n):
        # 今の日の usage が、stack の先頭より大きければ答えを確定できる
        while stack and usages[i] > usages[stack[-1]]:
            prev_index = stack.pop()
            answer[prev_index] = i - prev_index

        stack.append(i)

    return answer


# 実行例
usages1 = [30, 40, 35, 50, 45, 60]
usages2 = [70, 60, 50, 40]
usages3 = [20, 20, 30, 10, 40]

print(days_until_higher_usage(usages1))  # [1, 2, 1, 2, 1, 0]
print(days_until_higher_usage(usages2))  # [0, 0, 0, 0]
print(days_until_higher_usage(usages3))  # [2, 1, 2, 1, 0]
