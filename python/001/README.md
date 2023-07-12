# No.001

以下のコードはユーザーが入力した数値の合計を計算するプログラムです。<br>
しかし、現在の実装ではバグがあり正しい合計値を返しません。このコードのバグを見つけて修正してください。

```python
def calculate_sum(numbers):
    total = 0
    for num in numbers:
        total += num
    return total


# ユーザーから数値の入力を受け取る
input_numbers = input("数値をスペース区切りで入力してください: ")
numbers_list = input_numbers.split()

# 数値の合計を計算する
result = calculate_sum(numbers_list)
print("合計値:", result)
```
