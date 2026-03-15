from typing import List

def count_incident_periods(logs: List[int]) -> int:
    """
    1 の連続区間数を数える。
    logs[i] == 1 かつ
    i == 0 または logs[i-1] == 0
    のとき、新しい区間の開始とみなせる。

    計算量: O(n)
    """
    count = 0

    for i in range(len(logs)):
        if logs[i] == 1 and (i == 0 or logs[i - 1] == 0):
            count += 1

    return count


if __name__ == "__main__":
    print(count_incident_periods([1, 1, 0, 1, 0, 1, 1, 1]))  # 3
    print(count_incident_periods([0, 0, 0]))                  # 0
    print(count_incident_periods([1, 1, 1, 1]))               # 1
