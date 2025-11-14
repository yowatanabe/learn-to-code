from typing import Set


def length_of_longest_substring(s: str) -> int:
    """
    文字列 s に対して、全ての文字がユニークな
    最長部分文字列の長さを O(n) で求める。

    アルゴリズム: スライディングウィンドウ
      - left, right の2つのポインタで現在のウィンドウ [left, right) を表す
      - window_chars という set で、ウィンドウ内に含まれる文字を管理
      - right を1つずつ右へ伸ばす。
        - s[right] が window_chars にまだ無いなら、そのまま追加して right++、
          長さを更新
        - すでに存在する場合、
          left を右へ動かしながら、重複文字が消えるまで window_chars から削除
      - 文字列全体を1回なめるので時間計算量は O(n)
    """
    n = len(s)
    if n == 0:
        return 0

    window_chars: Set[str] = set()
    left = 0
    max_len = 0

    for right in range(n):
        # s[right] を追加する前に、重複しないよう left を進める
        while s[right] in window_chars:
            window_chars.remove(s[left])
            left += 1

        # ここまでくれば s[right] はウィンドウ内に存在しない
        window_chars.add(s[right])

        # 現在のウィンドウ長は right - left + 1
        current_len = right - left + 1
        if current_len > max_len:
            max_len = current_len

    return max_len


# 要求どおり print で結果を出力する部分
if __name__ == "__main__":
    # 例1
    s1 = "abcabcbb"
    print(length_of_longest_substring(s1))

    # 例2
    s2 = "bbbbb"
    print(length_of_longest_substring(s2))

    # 例3
    s3 = "pwwkew"
    print(length_of_longest_substring(s3))

    # 例4
    s4 = ""
    print(length_of_longest_substring(s4))