from typing import List

def shortest_subarray_to_remove(lat: List[int], limit: int) -> int:
    """
    最短の連続区間を削除して、残りを非減少にする。

    典型解法:
    1) 左から見て非減少が崩れる直前までを prefix とする（[0..l]）
    2) 右から見て非減少が崩れる直後からを suffix とする（[r..n-1]）
    3) prefix と suffix をうまく“つなげる”ように、2ポインタで最短削除長を探す

    計算量: O(n), メモリ: O(1)
    ※ limit は本問では使わない（ダミー）
    """
    n = len(lat)
    if n <= 1:
        return 0

    # 1) 最長の非減少 prefix の末尾 l を探す
    l = 0
    while l + 1 < n and lat[l] <= lat[l + 1]:
        l += 1
    if l == n - 1:
        return 0  # 既に非減少

    # 2) 最長の非減少 suffix の先頭 r を探す
    r = n - 1
    while r - 1 >= 0 and lat[r - 1] <= lat[r]:
        r -= 1

    # まず、prefixだけ残す（suffixを全部消す）/ suffixだけ残す（prefixを全部消す）を候補に
    ans = min(n - (l + 1), r)

    # 3) prefix[i] と suffix[j] を繋げられる最小削除を探す
    i = 0
    j = r
    while i <= l and j < n:
        if lat[i] <= lat[j]:
            # i と j を繋げるなら削除区間は (i+1 .. j-1)
            ans = min(ans, j - i - 1)
            i += 1
        else:
            j += 1

    return ans

if __name__ == "__main__":
    print(shortest_subarray_to_remove([1, 2, 3, 10, 4, 5, 6], 0))    # 2
    print(shortest_subarray_to_remove([1, 2, 3], 100))               # 0
    print(shortest_subarray_to_remove([5, 4, 3, 2, 1], 0))           # 4
