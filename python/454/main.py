from bisect import bisect_left, insort


def sliding_window_median(times, k):
    window = sorted(times[:k])
    result = []

    def get_median():
        if k % 2 == 1:
            return window[k // 2]
        return (window[k // 2 - 1] + window[k // 2]) / 2

    result.append(get_median())

    for right in range(k, len(times)):
        out_value = times[right - k]
        in_value = times[right]

        # 古い値を削除
        remove_index = bisect_left(window, out_value)
        window.pop(remove_index)

        # 新しい値を挿入
        insort(window, in_value)

        result.append(get_median())

    return result


# 実行例
times1 = [1, 3, 2, 6, 4, 5]
k1 = 3

times2 = [1, 2, 3, 4]
k2 = 2

times3 = [5, 5, 5]
k3 = 1

print(sliding_window_median(times1, k1))  # [2, 3, 4, 5]
print(sliding_window_median(times2, k2))  # [1.5, 2.5, 3.5]
print(sliding_window_median(times3, k3))  # [5, 5, 5]
