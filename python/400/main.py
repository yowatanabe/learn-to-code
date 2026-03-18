from collections import defaultdict

def longest_repeating_after_k_replacements(s: str, k: int) -> int:
    """
    スライディングウィンドウの典型問題。

    ウィンドウ [left, right] において、
    「この区間を全部同じ文字にするために必要な置換回数」は

        ウィンドウ長 - 区間内で最も多い文字の出現回数

    となる。

    この値が k 以下である限りウィンドウを広げ、
    超えたら left を縮める。

    計算量: O(n)
    """
    count = defaultdict(int)
    left = 0
    max_freq = 0
    best = 0

    for right, ch in enumerate(s):
        count[ch] += 1
        max_freq = max(max_freq, count[ch])

        # 置換必要数 = window_size - max_freq
        while (right - left + 1) - max_freq > k:
            count[s[left]] -= 1
            left += 1

        best = max(best, right - left + 1)

    return best


if __name__ == "__main__":
    print(longest_repeating_after_k_replacements("ABAB", 2))     # 4
    print(longest_repeating_after_k_replacements("AABABBA", 1))  # 4
    print(longest_repeating_after_k_replacements("ABCDE", 1))    # 2
