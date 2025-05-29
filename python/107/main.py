def sum_even_or_odd(nums):
    total = sum(nums)
    return "even" if total % 2 == 0 else "odd"


# テスト
print(sum_even_or_odd([1, 2, 3]))  # "even"
print(sum_even_or_odd([1, 2, 4]))  # "odd"
print(sum_even_or_odd([]))  # "even"
