from functools import lru_cache


def min_compressed_length(s, k):
    n = len(s)

    def encoded_len(count):
        if count == 1:
            return 1
        return 1 + len(str(count))

    @lru_cache(None)
    def dp(index, remaining_k):
        if remaining_k < 0:
            return float("inf")

        if index >= n:
            return 0

        # 現在の文字を削除する
        best = dp(index + 1, remaining_k - 1)

        same_count = 0
        delete_count = 0

        # index の文字を残すグループとして、どこまで伸ばせるか試す
        for j in range(index, n):
            if s[j] == s[index]:
                same_count += 1
            else:
                delete_count += 1

            if delete_count > remaining_k:
                break

            best = min(
                best, encoded_len(same_count) + dp(j + 1, remaining_k - delete_count)
            )

        return best

    return dp(0, k)


# 実行例
s1 = "aaabcccd"
k1 = 2

s2 = "aabbaa"
k2 = 2

s3 = "abc"
k3 = 1

print(min_compressed_length(s1, k1))  # 4
print(min_compressed_length(s2, k2))  # 2
print(min_compressed_length(s3, k3))  # 2
