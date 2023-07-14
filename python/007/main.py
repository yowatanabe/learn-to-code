fruits = ["apple", "orange", "strawberry"]


# Solution 1 (Use Lambda)
ans1 = list(map(lambda i: len(i), fruits))
print(ans1)


# Solution 2 (If no Lambda is used)
ans2 = []
for fruit in fruits:
    ans2.append(len(fruit))
print(ans2)
