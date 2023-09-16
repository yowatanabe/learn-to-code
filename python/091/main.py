import requests

# ユーザーにURLとキーワードの入力を求める
url = input("URLを入力してください: ")
keyword = input("検索したいキーワードを入力してください: ")

try:
    # URLからウェブページの内容をダウンロード
    response = requests.get(url)
    response.raise_for_status()

    print(response.text)

    # キーワードがウェブページのコンテンツに含まれているかチェック
    if keyword in response.text:
        print(f"{keyword} はウェブページの内容に含まれています。")
    else:
        print(f"{keyword} はウェブページの内容に含まれていません。")

except requests.exceptions.RequestException as e:
    print(f"RequestsError: {e}")
except Exception as e:
    print(f"エラー: {e}")
