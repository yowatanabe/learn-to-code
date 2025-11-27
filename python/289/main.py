from typing import List


def daily_temperatures(temperatures: List[int]) -> List[int]:
    """
    各日について、より暖かい日が来るまで何日待つかを求める。
    単調減少スタック（index を積む）で O(n) で解く。
    """
    n = len(temperatures)
    ans = [0] * n  # デフォルトは 0 （より暖かい日が来ない場合）
    stack = []  # 「まだ答えが決まっていない日」のインデックスを積む

    for i, temp in enumerate(temperatures):
        # 現在の気温が、スタック上部の気温より高い限り
        # そのスタック要素の日の「待ち日数」が確定する
        while stack and temperatures[stack[-1]] < temp:
            prev_index = stack.pop()
            ans[prev_index] = i - prev_index  # 何日後か = インデックス差

        # 自分自身はまだ「この先でより高い日」がわからないのでスタックに積む
        stack.append(i)

    return ans


if __name__ == "__main__":
    # 実行例1
    temps1 = [73, 74, 75, 71, 69, 72, 76, 73]
    print("例1の入力:", temps1)
    print("例1の結果:", daily_temperatures(temps1))  # [1, 1, 4, 2, 1, 1, 0, 0]

    # 実行例2
    temps2 = [30, 40, 50, 60]
    print("例2の入力:", temps2)
    print("例2の結果:", daily_temperatures(temps2))  # [1, 1, 1, 0]

    # 実行例3
    temps3 = [30, 60, 90]
    print("例3の入力:", temps3)
    print("例3の結果:", daily_temperatures(temps3))  # [1, 1, 0]
