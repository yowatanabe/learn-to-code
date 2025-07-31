def product_except_self(nums):
    n = len(nums)
    left = [1] * n
    right = [1] * n
    answer = [1] * n

    for i in range(1, n):
        left[i] = left[i - 1] * nums[i - 1]
    for i in range(n - 2, -1, -1):
        right[i] = right[i + 1] * nums[i + 1]
    for i in range(n):
        answer[i] = left[i] * right[i]
    return answer


# テスト例
print(product_except_self([1, 2, 3, 4]))  # [24,12,8,6]
print(product_except_self([2, 3, 0, 4]))  # [0,0,24,0]
