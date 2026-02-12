from typing import List

def jump(nums: List[int]) -> int:
    """
    Greedy:
    現在のジャンプで到達可能な範囲 [0..end] を走査しながら、
    次のジャンプで到達可能な最遠 next_end を更新する。
    i が end に到達したらジャンプ回数+1して end=next_end に進める。
    """
    n = len(nums)
    if n <= 1:
        return 0

    jumps = 0
    end = 0        # 現在のジャンプ回数で到達できる最遠
    next_end = 0   # 次のジャンプ回数で到達できる最遠

    for i in range(n - 1):
        next_end = max(next_end, i + nums[i])

        if i == end:
            jumps += 1
            end = next_end
            if end >= n - 1:
                break

    return jumps


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([2, 3, 1, 1, 4], 2),
        ([2, 3, 0, 1, 4], 2),
        ([1, 1, 1, 1], 3),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = jump(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
