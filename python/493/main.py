def longest_average_under_limit(requests, limit):
    transformed = [x - limit for x in requests]

    prefix = [0]
    for value in transformed:
        prefix.append(prefix[-1] + value)

    stack = []
    for i in range(len(prefix)):
        if not stack or prefix[i] > prefix[stack[-1]]:
            stack.append(i)

    answer = 0

    for j in range(len(prefix) - 1, -1, -1):
        while stack and prefix[j] <= prefix[stack[-1]]:
            answer = max(answer, j - stack[-1])
            stack.pop()

    return answer


requests1 = [5, 1, 3, 2, 6]
limit1 = 3

requests2 = [10, 10, 10]
limit2 = 5

requests3 = [1, 2, 3, 4]
limit3 = 3

print(longest_average_under_limit(requests1, limit1))  # 4
print(longest_average_under_limit(requests2, limit2))  # 0
print(longest_average_under_limit(requests3, limit3))  # 4
