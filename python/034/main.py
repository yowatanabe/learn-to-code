import os

import pandas as pd

current_path = os.getcwd()
csv_path = os.path.join(current_path, "data.csv")


def search(job_title):
    df = pd.read_csv(csv_path)
    df = df[df["職業"] == job_title]
    if df.empty:
        print("該当する人物が見つかりませんでした。")
    else:
        print(df)


job_title = input("職業を入力してください: ")

search(job_title)
