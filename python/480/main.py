from collections import defaultdict


def group_service_names(names):
    groups = defaultdict(list)

    for name in names:
        key = tuple(sorted(name))
        groups[key].append(name)

    return list(groups.values())


# 実行例
names1 = ["api", "pia", "db", "bd", "cache"]
names2 = ["abc", "bca", "cab", "xyz"]
names3 = ["a"]

print(group_service_names(names1))  # [['api', 'pia'], ['db', 'bd'], ['cache']]
print(group_service_names(names2))  # [['abc', 'bca', 'cab'], ['xyz']]
print(group_service_names(names3))  # [['a']]
