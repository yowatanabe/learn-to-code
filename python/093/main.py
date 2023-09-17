import csv

import requests
from bs4 import BeautifulSoup


def collect_data_from_website(url, csv_file):
    try:
        # Webサイトからデータを取得
        response = requests.get(url)
        response.raise_for_status()

        # HTMLを解析
        soup = BeautifulSoup(response.text, "html.parser")

        # データを収集してCSVに保存
        data = []
        table = soup.find("table")

        if table:
            rows = table.find_all("tr")
            header = []

            for row in rows:
                cols = row.find_all(["th", "td"])
                cols = [col.text.strip() for col in cols]
                if not header:
                    header = cols
                else:
                    data.append(cols)

        if data:
            # CSVファイルにデータを書き込む
            with open(csv_file, "w", newline="") as csvfile:
                csvwriter = csv.writer(csvfile)
                if header:
                    csvwriter.writerow(header)
                csvwriter.writerows(data)

            print(f"{len(data)} 行のデータを {csv_file} に保存しました。")
        else:
            print("データがありませんでした。")

    except Exception as e:
        print(f"エラー: {e}")


url = input("データを収集するWebサイトのURLを入力: ")
csv_file = input("データを保存するCSVファイルの名前を入力: ")

collect_data_from_website(url, csv_file)
