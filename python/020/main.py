import json

d = {"name": "John", "age": 25, "city": "New York"}
print(f"変換前のデータの値: {d}")
print(f"変換前のデータの型: {type(d)}")

j = json.dumps(d)
print(f"変換後のデータの値: {j}")
print(f"変換後のデータの型: {type(j)}")
