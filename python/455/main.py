def max_incident_profit(scores):
    min_score = scores[0]
    max_profit = 0

    for score in scores[1:]:
        profit = score - min_score
        max_profit = max(max_profit, profit)
        min_score = min(min_score, score)

    return max_profit


# 実行例
scores1 = [7, 1, 5, 3, 6, 4]
scores2 = [7, 6, 4, 3, 1]
scores3 = [2, 4, 1, 8]

print(max_incident_profit(scores1))  # 5
print(max_incident_profit(scores2))  # 0
print(max_incident_profit(scores3))  # 7
