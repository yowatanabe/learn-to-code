def longest_common_prefix(files):
    if not files:
        return ""

    prefix = files[0]

    for file_name in files[1:]:
        while not file_name.startswith(prefix):
            prefix = prefix[:-1]

            if prefix == "":
                return ""

    return prefix


# 実行例
files1 = ["app-error.log", "app-event.log", "app-export.log"]
files2 = ["api.log", "db.log", "cache.log"]
files3 = ["server", "server-1", "server-2"]

print(longest_common_prefix(files1))  # app-e
print(longest_common_prefix(files2))  #
print(longest_common_prefix(files3))  # server
