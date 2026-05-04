from collections import deque


def longest_stable_window(metrics, limit):
    max_deque = deque()  # 値が大きい順になるように index を管理
    min_deque = deque()  # 値が小さい順になるように index を管理

    left = 0
    answer = 0

    for right in range(len(metrics)):
        # 最大値候補を管理
        while max_deque and metrics[max_deque[-1]] < metrics[right]:
            max_deque.pop()
        max_deque.append(right)

        # 最小値候補を管理
        while min_deque and metrics[min_deque[-1]] > metrics[right]:
            min_deque.pop()
        min_deque.append(right)

        # 条件を満たさない間、左端を縮める
        while metrics[max_deque[0]] - metrics[min_deque[0]] > limit:
            if max_deque[0] == left:
                max_deque.popleft()
            if min_deque[0] == left:
                min_deque.popleft()
            left += 1

        answer = max(answer, right - left + 1)

    return answer


# 実行例
metrics1 = [8, 2, 4, 7]
limit1 = 4

metrics2 = [10, 1, 2, 4, 7, 2]
limit2 = 5

metrics3 = [4, 4, 4, 4]
limit3 = 0

print(longest_stable_window(metrics1, limit1))  # 2
print(longest_stable_window(metrics2, limit2))  # 4
print(longest_stable_window(metrics3, limit3))  # 4
