import requests
from bs4 import BeautifulSoup as bs


def get_webpage_title(url):
    try:
        # requestsでHTMLコンテンツを取得
        response = requests.get(url)

        # BeautifulSoupでHTMLコンテンツのタイトルの情報を取得
        soup = bs(response.text, "html.parser")
        title = soup.find("title")

        # 結果を出力
        print(f"ウェブページのタイトル：{title.text}")

    except Exception as e:
        print("😢エラー：", e)


# 検索対象のウェブページを指定
url = "https://example.com/"

get_webpage_title(url)
