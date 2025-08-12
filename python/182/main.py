def daily_temperatures(temperatures: list[int]) -> list[int]:
    n = len(temperatures)
    ans = [0] * n
    stack = (
        []
    )  # 気温が「まだ次の高温が見つかっていない」日のインデックスを単調減少で保持

    for i, t in enumerate(temperatures):
        # 今日の気温 t が、スタック上位（日にち）の気温より高ければ解決できる
        while stack and temperatures[stack[-1]] < t:
            j = stack.pop()
            ans[j] = i - j
        stack.append(i)

    return ans


# テスト
print(daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]))  # [1,1,4,2,1,1,0,0]
print(daily_temperatures([30, 40, 50, 60]))  # [1,1,1,0]
print(daily_temperatures([30, 60, 90]))  # [1,1,0]
