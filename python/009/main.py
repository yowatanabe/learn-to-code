students = {"Alice": 18, "Bob": 20, "Charlie": 19, "David": 22, "Eve": 21}


# lambda使用
d = dict(map(lambda student: (student[1], student[0]), students.items()))
print(d)


# lambda未使用
d = {}
for k, v in students.items():
    d[v] = k
print(d)


# lambda未使用
print({v: k for k, v in students.items()})
