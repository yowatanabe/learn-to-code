from collections import defaultdict


def character_replacement(s: str, k: int) -> int:
    """
    スライディングウィンドウ:
    - いまのウィンドウで最頻文字の出現数を max_count とする
    - ウィンドウ長 - max_count が k を超えたら左端を縮める
    - ポイント: max_count は縮めるときに厳密に更新しなくても正答（上限）を保てる
    時間 O(n), 追加メモリ O(1)（26文字ぶん）
    """
    count = defaultdict(int)
    left = 0
    max_count = 0
    ans = 0

    for right, ch in enumerate(s):
        count[ch] += 1
        if count[ch] > max_count:
            max_count = count[ch]

        # 置換が k を超えるなら縮める
        while (right - left + 1) - max_count > k:
            count[s[left]] -= 1
            left += 1

        ans = max(ans, right - left + 1)

    return ans


# テスト
print(character_replacement("ABAB", 2))  # 4
print(character_replacement("AABABBA", 1))  # 4
print(character_replacement("AAAA", 0))  # 4
print(character_replacement("ABCDEF", 2))  # 3
