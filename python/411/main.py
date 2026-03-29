from typing import List

def find_anagrams(s: str, p: str) -> List[int]:
    """
    スライディングウィンドウで解く典型問題。

    考え方:
    - p の文字頻度を数える
    - s 上で長さ len(p) の窓を動かしながら、窓内の文字頻度を管理する
    - 頻度が一致したら、その左端インデックスが答え

    英小文字のみなので、長さ26の配列で頻度管理する。
    計算量: O(len(s) + len(p))
    """
    if len(p) > len(s):
        return []

    def idx(ch: str) -> int:
        return ord(ch) - ord("a")

    need = [0] * 26
    window = [0] * 26

    for ch in p:
        need[idx(ch)] += 1

    result = []
    k = len(p)

    for i, ch in enumerate(s):
        window[idx(ch)] += 1

        # 窓サイズが k を超えたら左端を1つ外す
        if i >= k:
            window[idx(s[i - k])] -= 1

        # 窓サイズがちょうど k になったら比較
        if i >= k - 1 and window == need:
            result.append(i - k + 1)

    return result


if __name__ == "__main__":
    print(find_anagrams("cbaebabacd", "abc"))  # [0, 6]
    print(find_anagrams("abab", "ab"))         # [0, 1, 2]
    print(find_anagrams("aaaaa", "b"))         # []
