from collections import Counter
from typing import List


def find_anagrams(s: str, p: str) -> List[int]:
    n, m = len(s), len(p)
    if m > n:
        return []

    need = Counter(p)
    window = Counter(s[:m])
    ans = []

    if window == need:
        ans.append(0)

    # スライディングウィンドウで長さmを保ちながら1文字ずつ右へ
    for i in range(m, n):
        add_ch = s[i]
        del_ch = s[i - m]

        window[add_ch] += 1
        window[del_ch] -= 1
        if window[del_ch] == 0:
            del window[del_ch]  # サイズ削減で高速化（等価比較が速くなる）

        if window == need:
            ans.append(i - m + 1)

    return ans


# テスト
print(find_anagrams("cbaebabacd", "abc"))  # [0, 6]
print(find_anagrams("abab", "ab"))  # [0, 1, 2]
print(find_anagrams("aaaaa", "aa"))  # [0, 1, 2, 3]
print(find_anagrams("short", "longer"))  # []
