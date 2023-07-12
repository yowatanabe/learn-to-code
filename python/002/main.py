original_dict = {"apple": "red", "banana": "yellow", "grape": "purple"}
print(original_dict)

swap_dict = {v: k for k, v in original_dict.items()}
print(swap_dict)
