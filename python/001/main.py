def calculate_sum(numbers):
    total = 0
    for num in numbers:
        total += int(num)
    return total


# ユーザーから数値の入力を受け取る
input_numbers = input("数値をスペース区切りで入力してください: ")
numbers_list = input_numbers.split()

# 数値の合計を計算する
result = calculate_sum(numbers_list)
print("合計値:", result)
