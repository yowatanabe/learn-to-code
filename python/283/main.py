def max_area(height):
    """
    与えられた高さ配列から、2本の線を選んで作れる
    容器の最大面積を返す。
    """
    left = 0
    right = len(height) - 1
    ans = 0

    # 2本のポインタを両端から動かす二分木っぽい二-pointer法
    while left < right:
        h = min(height[left], height[right])
        width = right - left
        area = h * width
        if area > ans:
            ans = area

        # 低い方を動かすのがポイント
        # 高い方を動かしても高さは改善しないため、面積は増えにくい
        if height[left] < height[right]:
            left += 1
        else:
            right -= 1

    return ans


if __name__ == "__main__":
    # 実行例1
    height1 = [1, 8, 6, 2, 5, 4, 8, 3, 7]
    print(max_area(height1))  # 49

    # 実行例2
    height2 = [1, 1]
    print(max_area(height2))  # 1

    # 実行例3
    height3 = [4, 3, 2, 1, 4]
    print(max_area(height3))  # 16
