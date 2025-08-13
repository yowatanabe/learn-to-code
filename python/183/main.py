from collections import deque


def longest_subarray_with_limit(nums: list[int], limit: int) -> int:
    # 単調キュー（両端キュー）で現在ウィンドウの最大値・最小値を管理
    maxdq = deque()  # 値が降順になるように保持（先頭が最大）
    mindq = deque()  # 値が昇順になるように保持（先頭が最小）
    left = 0
    ans = 0

    for right, x in enumerate(nums):
        # maxdq 更新（降順維持）
        while maxdq and maxdq[-1] < x:
            maxdq.pop()
        maxdq.append(x)

        # mindq 更新（昇順維持）
        while mindq and mindq[-1] > x:
            mindq.pop()
        mindq.append(x)

        # 条件を満たすまで左端を縮める
        while maxdq[0] - mindq[0] > limit:
            # 左端要素を取り除く必要がある場合、対応してキューも更新
            if nums[left] == maxdq[0]:
                maxdq.popleft()
            if nums[left] == mindq[0]:
                mindq.popleft()
            left += 1

        ans = max(ans, right - left + 1)

    return ans


# テスト
print(longest_subarray_with_limit([8, 2, 4, 7], 4))  # 2
print(longest_subarray_with_limit([10, 1, 2, 4, 7, 2], 5))  # 4
print(longest_subarray_with_limit([4, 2, 2, 2, 4, 4, 2, 2], 0))  # 3
