def length_of_LIS(nums: list[int]) -> int:
    # tails[i] は「長さ i+1 の増加部分列」を作る末尾最小値
    import bisect

    tails = []
    for x in nums:
        # x を置ける最初の位置に二分探索で入れる
        i = bisect.bisect_left(tails, x)
        if i == len(tails):
            tails.append(x)
        else:
            tails[i] = x
    return len(tails)


# テスト
print(length_of_LIS([10, 9, 2, 5, 3, 7, 101, 18]))  # 4
print(length_of_LIS([0, 1, 0, 3, 2, 3]))  # 4
print(length_of_LIS([7, 7, 7, 7, 7]))  # 1
