from typing import List


def min_servers(intervals: List[List[int]]) -> int:
    """
    半開区間 [s, e) のジョブ群を落とさず処理するための
    最小サーバ台数（= 最大同時実行数）を返す。
    速度: O(n log n), 追加メモリ: O(1)（ソート除く）
    """
    n = len(intervals)
    if n == 0:
        return 0

    starts = sorted(iv[0] for iv in intervals)
    ends = sorted(iv[1] for iv in intervals)

    i = j = 0
    running = 0
    answer = 0

    # 半開区間なので starts[i] < ends[j] なら新規開始が先
    while i < n and j < n:
        if starts[i] < ends[j]:
            running += 1
            answer = max(answer, running)
            i += 1
        else:
            running -= 1
            j += 1

    # 片方が尽きても running は減るだけなので answer は確定済み
    return answer


# 簡単なテスト
if __name__ == "__main__":
    tests = [
        ([[0, 30], [5, 10], [15, 20]], 2),
        ([[7, 10], [2, 4]], 1),
        ([[1, 3], [3, 5], [5, 8]], 1),
        ([], 0),
        ([[1, 1000000000], [2, 3], [3, 4], [4, 5]], 2),
        ([[0, 1], [0, 1], [0, 1]], 3),
        ([[5, 5]], 0),  # 長さ0の区間は同時数に影響しない
        ([[1, 2], [2, 3], [1, 3]], 2),  # [1,3) と [1,2) が重なる最大2
    ]
    for i, (intervals, exp) in enumerate(tests, 1):
        got = min_servers(intervals)
        assert got == exp, f"case{i}: expected {exp}, got {got}"
    print("All tests passed.")


print(min_servers([[0, 30], [5, 10], [15, 20]]))
print(min_servers([[7, 10], [2, 4]]))
print(min_servers([[1, 3], [3, 5], [5, 8]]))
print(min_servers([]))
print(min_servers([[1, 1000000000], [2, 3], [3, 4], [4, 5]]))
