from typing import List

def car_fleet(target: int, position: List[int], speed: List[int]) -> int:
    cars = sorted(zip(position, speed), reverse=True)  # pos降順
    fleets = 0
    max_time = -1.0

    for pos, spd in cars:
        t = (target - pos) / spd
        if t > max_time:
            fleets += 1
            max_time = t
        # else: 追いつくのでfleetに吸収

    return fleets


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3], 3),
        (10, [3], [3], 1),
        (100, [0, 2, 4], [4, 2, 1], 3),
    ]

    for i, (target, position, speed, expected) in enumerate(cases, start=1):
        got = car_fleet(target, position, speed)
        print(f"例{i} 入力: target={target}, position={position}, speed={speed}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
