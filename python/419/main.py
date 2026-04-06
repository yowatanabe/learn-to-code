from collections import Counter


def least_interval(tasks, n):
    counter = Counter(tasks)
    max_freq = max(counter.values())  # 最も多いタスクの出現回数
    max_count = sum(1 for freq in counter.values() if freq == max_freq)
    # max_count は「最頻出タスクが何種類あるか」

    # 最頻出タスクを並べたときの枠組みを考える
    # (max_freq - 1) 個の区切りがあり、それぞれの長さは (n + 1)
    # 最後に最頻出タスク群 max_count 個を置く
    candidate = (max_freq - 1) * (n + 1) + max_count

    # 実際には、待機が不要なほどタスクが多ければ len(tasks) が答えになる
    return max(candidate, len(tasks))


# 実行例
tasks1 = ["A", "A", "A", "B", "B", "B"]
n1 = 2

tasks2 = ["A", "A", "A", "B", "B", "B"]
n2 = 0

tasks3 = ["A", "A", "A", "A", "B", "C", "D"]
n3 = 2

print(least_interval(tasks1, n1))  # 8
print(least_interval(tasks2, n2))  # 6
print(least_interval(tasks3, n3))  # 10
