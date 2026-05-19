def longest_valid_deploy_period(s):
    score = 0
    first_seen = {}
    answer = 0

    for i, ch in enumerate(s):
        if ch == "S":
            score += 1
        else:
            score -= 1

        # 累積スコアが正なら、0 から i まで全体が有効
        if score > 0:
            answer = i + 1
        else:
            # score - 1 が過去にあれば、その次から i までの区間は正になる
            if score - 1 in first_seen:
                answer = max(answer, i - first_seen[score - 1])

        # 各スコアは最初に出た位置だけ記録する
        if score not in first_seen:
            first_seen[score] = i

    return answer


# 実行例
s1 = "SFFSS"
s2 = "FFSS"
s3 = "FFFF"

print(longest_valid_deploy_period(s1))  # 5
print(longest_valid_deploy_period(s2))  # 3
print(longest_valid_deploy_period(s3))  # 0
