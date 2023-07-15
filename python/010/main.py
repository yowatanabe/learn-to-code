grades = [85, 92, 78, 90, 87, 82, 95, 88, 76, 91]


# lambda使用
# この書き方はFlake8でE731の警告が出る
# https://www.flake8rules.com/rules/E731.html
x = lambda x: sum(x) / len(x)
print(x(grades))


# lambda未使用
print(sum(grades) / len(grades))
