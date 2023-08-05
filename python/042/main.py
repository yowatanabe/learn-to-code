import csv

import requests
from bs4 import BeautifulSoup


def scrape_website(website_url, csv_file):
    try:
        # 出力ファイル名の入力がない場合は"output.txt"に設定
        if not csv_file:
            csv_file = "output.txt"

        # WEBサイトから情報を取得
        response = requests.get(website_url)
        response.raise_for_status()

        # HTMLをパース
        soup = BeautifulSoup(response.content, "html.parser")

        # 必要な情報を抽出してリストに格納
        # 本例ではWEBサイト内のリンクを取得する
        data_list = []

        links = soup.select("a")

        for link in links:
            data_list.append(link.get("href"))

        # 取得した情報をCSVファイルに保存
        with open(csv_file, "w", newline="", encoding="utf-8") as csv_file:
            csv_writer = csv.writer(csv_file)
            csv_writer.writerow(["WEBサイト内のリンク"])
            for data in data_list:
                csv_writer.writerow([data])

        print("CSVファイルに保存しました")
        for data in data_list:
            print(data)

    except requests.exceptions.ConnectionError:
        print("WEBサイトへのリクエストが失敗しました")


website_url = input("スクレイピング対象のウェブサイトのURL: ")
csv_file = input("CSVファイル名(output.txt): ")

scrape_website(website_url, csv_file)
