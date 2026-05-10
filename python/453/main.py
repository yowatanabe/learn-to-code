def longest_consecutive_versions(versions):
    version_set = set(versions)
    longest = 0

    for version in version_set:
        # 連続列の開始地点だけを処理する
        if version - 1 not in version_set:
            current = version
            length = 1

            while current + 1 in version_set:
                current += 1
                length += 1

            longest = max(longest, length)

    return longest


# 実行例
versions1 = [100, 4, 200, 1, 3, 2]
versions2 = [10, 5, 6, 7, 20]
versions3 = [1, 2, 2, 3]

print(longest_consecutive_versions(versions1))  # 4
print(longest_consecutive_versions(versions2))  # 3
print(longest_consecutive_versions(versions3))  # 3
