from typing import List, Dict


def minimum_incompatibility(nums: List[int], k: int) -> int:
    n = len(nums)
    g = n // k

    # 不可能判定：同じ値が k を超えると必ずどこかのグループで重複する
    # （1グループに同値は1つまでなので、同値がk回より多いと置き場がない）
    from collections import Counter

    cnt = Counter(nums)
    if any(v > k for v in cnt.values()):
        return -1

    # 1グループ候補の cost を作る
    cost: Dict[int, int] = {}
    for mask in range(1 << n):
        if mask.bit_count() != g:
            continue
        seen = set()
        vals = []
        ok = True
        for i in range(n):
            if mask >> i & 1:
                if nums[i] in seen:
                    ok = False
                    break
                seen.add(nums[i])
                vals.append(nums[i])
        if ok:
            cost[mask] = max(vals) - min(vals)

    INF = 10**15
    dp = [INF] * (1 << n)
    dp[0] = 0

    for mask in range(1 << n):
        if dp[mask] == INF:
            continue
        # 次に作るグループの元になる「未使用要素」集合
        unused = ((1 << n) - 1) ^ mask
        if unused == 0:
            continue

        # 未使用のうち最小インデックスを必ず含める（重複遷移を削減）
        first = unused & -unused  # 最下位ビット
        sub = unused
        while sub:
            # first を含み、サイズ g のものだけ見る
            if (sub & first) and (sub.bit_count() == g) and (sub in cost):
                dp[mask | sub] = min(dp[mask | sub], dp[mask] + cost[sub])
            sub = (sub - 1) & unused

    ans = dp[(1 << n) - 1]
    return -1 if ans == INF else ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 1, 4], 2, 4),
        ([6, 3, 8, 1, 3, 1, 2, 2], 4, 6),
        ([1, 1, 1, 1], 2, -1),
    ]

    for i, (nums, k, expected) in enumerate(cases, start=1):
        got = minimum_incompatibility(nums, k)
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
