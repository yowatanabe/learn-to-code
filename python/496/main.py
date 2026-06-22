def max_path_depth(paths):
    max_depth = 0

    for path in paths:
        parts = [part for part in path.split("/") if part]
        max_depth = max(max_depth, len(parts))

    return max_depth


# 実行例
paths1 = [
    "/app/log/error.log",
    "/app/log/access.log",
    "/db/mysql/slow/query.log"
]

paths2 = [
    "/api.log",
    "/db.log"
]

paths3 = [
    "/a/b",
    "/a/b/c",
    "/a/b/c/d"
]

print(max_path_depth(paths1))  # 4
print(max_path_depth(paths2))  # 1
print(max_path_depth(paths3))  # 4
