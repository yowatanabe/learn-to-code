from collections import Counter, defaultdict


def min_window_log(log, pattern):
    if len(pattern) > len(log):
        return ""

    need = Counter(pattern)
    window = defaultdict(int)

    required = len(need)
    formed = 0

    left = 0
    best_length = float("inf")
    best_start = 0

    for right, ch in enumerate(log):
        window[ch] += 1

        if ch in need and window[ch] == need[ch]:
            formed += 1

        while formed == required:
            current_length = right - left + 1

            if current_length < best_length:
                best_length = current_length
                best_start = left

            left_ch = log[left]
            window[left_ch] -= 1

            if left_ch in need and window[left_ch] < need[left_ch]:
                formed -= 1

            left += 1

    if best_length == float("inf"):
        return ""

    return log[best_start:best_start + best_length]


# 実行例
log1 = "ADOBECODEBANC"
pattern1 = "ABC"

log2 = "aa"
pattern2 = "aa"

log3 = "a"
pattern3 = "aa"

print(min_window_log(log1, pattern1))  # BANC
print(min_window_log(log2, pattern2))  # aa
print(min_window_log(log3, pattern3))  #
