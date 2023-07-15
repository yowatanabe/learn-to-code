t = (3, 7, 2, 1, 8)


# sum
print("合計は", sum(t), "です。")
print("合計は{}です。".format(sum(t)))
print(f"合計は{sum(t)}です。")


# for
result = 0
for x in t:
    result += x
print(result)
