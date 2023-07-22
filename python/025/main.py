from datetime import datetime, timedelta

# 作成したいレコード数
num = 100

# 日付のリスト生成
date_list = [datetime(2023, 1, 1) + timedelta(days=i) for i in range(num)]

# 日付を文字列に変換
date_str_list = [d.strftime("%Y-%m-%d") for d in date_list]

# 実行結果をファイル出力
file_path = "output.txt"
with open(file_path, "w") as f:
    for i in range(num):
        if i + 1 == num:
            f.write(f"  ({i+1}, {i+1:04}, '{date_str_list[i]}');")
        else:
            f.write(f"  ({i+1}, {i+1:04}, '{date_str_list[i]}'),\n")
