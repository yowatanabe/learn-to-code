inventory = {"apple": 10, "banana": 5, "orange": 8, "grape": 3, "mango": 12}
min_value = 5
max_value = 10


print({k: v for k, v in inventory.items() if min_value <= v <= max_value})
