from typing import List


def car_fleet(target: int, position: List[int], speed: List[int]) -> int:
    # 位置で降順に並べ、前にいる車から見る
    cars = sorted(zip(position, speed), key=lambda x: -x[0])

    fleets = 0
    max_time = 0.0  # これまでに形成された先頭車隊の到達時間（降順走査で非減少）

    for pos, sp in cars:
        # その車単独での到達時間
        t = (target - pos) / sp
        # 後続（今見ている車）が先頭の到達時間より「遅い」なら新しい車隊を形成
        # 速い（= t が小さい）場合は前の遅い車隊に追いついて合流する
        if t > max_time:
            fleets += 1
            max_time = t

    return fleets


# テスト
print(car_fleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]))  # 3
print(car_fleet(10, [3], [3]))  # 1
print(car_fleet(100, [0, 2, 4], [4, 2, 1]))  # 1
