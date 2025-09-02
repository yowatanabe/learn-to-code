from typing import List


def can_complete_circuit(gas: List[int], cost: List[int]) -> int:
    # 全体で不足なら不可能
    if sum(gas) < sum(cost):
        return -1

    start = 0
    tank = 0
    # 貪欲法：タンクが負になった区間の中ではどこから始めてもダメ
    for i in range(len(gas)):
        tank += gas[i] - cost[i]
        if tank < 0:
            # i までのどこから始めても失敗 → 次の i+1 を候補に
            start = i + 1
            tank = 0
    return start


# テスト
print(can_complete_circuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]))  # 3
print(can_complete_circuit([2, 3, 4], [3, 4, 3]))  # -1
print(can_complete_circuit([5], [4]))  # 0
