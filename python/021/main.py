import csv

filename = "data.csv"

with open(filename, "r") as f:
    # 1行ずつ読み込み
    reader = csv.reader(f)
    # 1行目をするためにnext関数を使用
    header = next(reader)
    # データ表示
    for row in reader:
        print(row)
