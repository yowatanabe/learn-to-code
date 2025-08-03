def check_possibility(nums):
    count = 0
    for i in range(1, len(nums)):
        if nums[i] < nums[i - 1]:
            count += 1
            if count > 1:
                return False
            if i == 1 or nums[i] >= nums[i - 2]:
                continue
            elif i + 1 >= len(nums) or nums[i + 1] >= nums[i - 1]:
                continue
            else:
                return False
    return True


# テスト例
print(check_possibility([4, 2, 3]))  # True
print(check_possibility([4, 2, 1]))  # False
print(check_possibility([1, 2, 10, 5, 7]))  # True
