import csv

import requests
from bs4 import BeautifulSoup


def scrape_and_save_to_csv(url):
    # スクレイピング結果ログ
    output_csv = "scraped_data.csv"
    # プログラム実行ログ
    log_file = "scraping_log.txt"

    try:
        # ウェブページのリクエストを送信
        response = requests.get(url)

        # レスポンスのHTMLコンテンツをパース
        soup = BeautifulSoup(response.text, "html.parser")

        # スクレイピングしたデータを取得（ここでは例としてタイトル要素を取得）
        title = soup.title.string

        # CSVにデータを保存
        with open(output_csv, "w", newline="", encoding="utf-8") as csv_file:
            csv_writer = csv.writer(csv_file)
            csv_writer.writerow(["ページURL", "タイトル"])
            csv_writer.writerow([url, title])

        with open(log_file, "w") as log:
            log.write(f"{webpage_url} のスクレイピングを実行しました")

        print("データがCSVファイルに保存されました。")

    except Exception as e:
        print(f"スクレイピング中にエラーが発生しました: {e}")
        with open(log_file, "w") as log:
            log.write(f"エラー: {e}")


webpage_url = input("スクレイピング対象のウェブページのURL: ")
scrape_and_save_to_csv(webpage_url)
