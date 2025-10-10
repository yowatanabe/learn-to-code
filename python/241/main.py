from collections import Counter


def min_window(s: str, t: str) -> str:
    if not s or not t or len(t) > len(s):
        return ""

    need = Counter(t)  # 必要な文字とその必要数
    missing = len(t)  # まだ満たしていない総文字数
    left = 0
    best = (float("inf"), 0, 0)  # (長さ, L, R)

    # スライディングウィンドウを右に伸ばす
    for right, ch in enumerate(s):
        if need[ch] > 0:
            missing -= 1
        need[ch] -= 1  # 不要分は負に落ちていく

        # すべて満たしたら、左端をできるだけ縮める
        while missing == 0:
            if right - left + 1 < best[0]:
                best = (right - left + 1, left, right)

            # 左端の文字を外す
            need[s[left]] += 1
            if need[s[left]] > 0:
                # 必須文字を1つ失ったので条件未満へ
                missing += 1
            left += 1

    return "" if best[0] == float("inf") else s[best[1] : best[2] + 1]


# テスト
print(min_window("ADOBECODEBANC", "ABC"))  # "BANC"
print(min_window("a", "a"))  # "a"
print(min_window("a", "aa"))  # ""
print(min_window("aaflslflsldkabc", "abc"))  # "abc"
