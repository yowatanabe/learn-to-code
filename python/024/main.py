import re


def validate_phone_number(phone_number):
    pattern = r"^\d{3}-\d{4}-\d{4}$"
    if re.match(pattern, phone_number):
        return True
    else:
        return False


input_phone_number = input("電話略号を入力してください：")

if validate_phone_number(input_phone_number):
    print("正しい電話略号です")
else:
    print("無効な電話略号です")
