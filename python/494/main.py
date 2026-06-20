def find_missing_ip_ranges(used, max_ip):
    result = []

    def format_range(start, end):
        if start == end:
            return str(start)
        return f"{start}->{end}"

    previous = -1

    for current in used:
        if current - previous >= 2:
            result.append(format_range(previous + 1, current - 1))
        previous = current

    if max_ip - previous >= 1:
        result.append(format_range(previous + 1, max_ip))

    return result


# 実行例
used1 = [0, 1, 3, 50, 75]
max_ip1 = 99

used2 = [0, 1, 2, 3]
max_ip2 = 3

used3 = []
max_ip3 = 5

print(find_missing_ip_ranges(used1, max_ip1))  # ['2', '4->49', '51->74', '76->99']
print(find_missing_ip_ranges(used2, max_ip2))  # []
print(find_missing_ip_ranges(used3, max_ip3))  # ['0->5']
