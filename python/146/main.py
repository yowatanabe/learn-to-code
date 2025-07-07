from collections import deque


def maxSlidingWindow(nums: list[int], k: int) -> list[int]:
    if not nums or k == 0:
        return []

    result = []
    dq = deque()  # インデックスを格納

    for i in range(len(nums)):
        # ウィンドウの左端を超えたインデックスは削除
        while dq and dq[0] < i - k + 1:
            dq.popleft()

        # 現在の数より小さいインデックスの値は右にある意味がないので削除
        while dq and nums[dq[-1]] < nums[i]:
            dq.pop()

        dq.append(i)

        # k個目以降のスライディングウィンドウ最大値を追加
        if i >= k - 1:
            result.append(nums[dq[0]])

    return result


# テスト
print(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3))  # 出力: [3,3,5,5,6,7]
print(maxSlidingWindow([1], 1))  # 出力: [1]
