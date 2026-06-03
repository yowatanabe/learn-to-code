def remove_duplicate_lines(lines):
    seen = set()
    result = []

    for line in lines:
        if line not in seen:
            seen.add(line)
            result.append(line)

    return result


# 実行例
lines1 = ["port=80", "host=web", "port=80", "timeout=30", "host=web"]
lines2 = ["a", "b", "c"]
lines3 = ["x", "x", "x"]

print(remove_duplicate_lines(lines1))  # ['port=80', 'host=web', 'timeout=30']
print(remove_duplicate_lines(lines2))  # ['a', 'b', 'c']
print(remove_duplicate_lines(lines3))  # ['x']
