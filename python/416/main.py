from typing import List

def car_fleet(target: int, position: List[int], speed: List[int]) -> int:
    """
    位置が前のジョブから順に見るのがポイント。

    各ジョブの「単独での到達時間」を計算し、
    目的地に近い順（position 降順）に見ていく。

    - 後ろのジョブの到達時間 <= 直前の車群の到達時間
      なら、その車群に追いつくので新しい車群は増えない
    - そうでなければ、新しい車群を作る

    計算量: O(n log n)  # ソートのため
    """
    cars = sorted(zip(position, speed), reverse=True)

    fleets = 0
    last_time = 0.0

    for pos, spd in cars:
        time = (target - pos) / spd

        if time > last_time:
            fleets += 1
            last_time = time

    return fleets


if __name__ == "__main__":
    print(car_fleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]))  # 3
    print(car_fleet(10, [3], [3]))                           # 1
    print(car_fleet(10, [0, 2, 4], [4, 2, 1]))               # 3
