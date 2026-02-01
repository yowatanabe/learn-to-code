from collections import Counter


def min_operations_to_unique(nums):
    # 重複する要素のカウント
    count = Counter(nums)

    # 重複した要素の削除回数は、各要素の個数から1を引いた分
    deletions = sum(freq - 1 for freq in count.values() if freq > 1)

    return deletions


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 2, 3, 3, 3], 2),
        ([5, 5, 5, 5], 3),
        ([1, 2, 3], 0),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = min_operations_to_unique(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
