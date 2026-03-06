from typing import List

def days_until_higher_latency(latencies: List[int]) -> List[int]:
    """
    単調スタックを使う典型問題。

    スタックには「まだ次に高い値が見つかっていない日のインデックス」を入れる。
    現在の値が、スタック上の日の値より大きければ、
    その日について答えを確定できる。

    計算量: O(n)
    """
    n = len(latencies)
    answer = [0] * n
    stack = []  # インデックスを保持。対応する値は単調減少になる

    for i, value in enumerate(latencies):
        while stack and latencies[stack[-1]] < value:
            prev = stack.pop()
            answer[prev] = i - prev
        stack.append(i)

    return answer


if __name__ == "__main__":
    print(days_until_higher_latency([73, 74, 75, 71, 69, 72, 76, 73]))
    # [1, 1, 4, 2, 1, 1, 0, 0]

    print(days_until_higher_latency([30, 40, 50, 60]))
    # [1, 1, 1, 0]

    print(days_until_higher_latency([30, 60, 90]))
    # [1, 1, 0]
