import time

import requests


# アラートを出力する関数
def send_alert(message):
    print(f"アラート: {message}")


# ウェブサイトの可用性を監視する関数
def monitor_website(website_url, interval):
    while True:
        try:
            response = requests.get(website_url)

            if response.status_code != 200:
                send_alert(f"ウェブサイトがオフラインです (HTTPステータスコード {response.status_code})")
            else:
                print("ウェブサイトはオンラインです")

        except requests.exceptions.RequestException:
            send_alert("ウェブサイトにアクセスできません")

        time.sleep(interval)


if __name__ == "__main__":
    website_url = input("監視対象のウェブサイトURL: ")
    interval = int(input("監視間隔(秒): "))

    monitor_website(website_url, interval)
