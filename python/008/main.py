nums = [2, 5, 8, 11, 4, 7, 6, 9, 3, 10]


# lambdaを使用する
result = list(filter(lambda num: num % 2 == 1, nums))
print(result)


# lambdaを使用しない
result = []
for num in nums:
    if num % 2 == 1:
        result.append(num)
print(result)
