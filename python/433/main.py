def compress_events(events):
    result = []
    count = 1

    for i in range(1, len(events) + 1):
        if i < len(events) and events[i] == events[i - 1]:
            count += 1
        else:
            if count == 1:
                result.append(events[i - 1])
            else:
                result.append(f"{events[i - 1]}:{count}")
            count = 1

    return result


# 実行例
events1 = ["db", "db", "db", "api", "api", "cache"]
events2 = ["error", "warn", "warn", "error"]
events3 = ["auth"]

print(compress_events(events1))  # ['db:3', 'api:2', 'cache']
print(compress_events(events2))  # ['error', 'warn:2', 'error']
print(compress_events(events3))  # ['auth']
