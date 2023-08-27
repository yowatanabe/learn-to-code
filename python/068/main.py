import time

import requests


def send_slack_notification(slack_webhook_url, alert_message):
    payload = {"text": alert_message}
    try:
        response = requests.post(slack_webhook_url, json=payload)
        response.raise_for_status()
        print("Slackに通知しました。")
    except requests.exceptions.RequestException as e:
        print(f"Slack通知に失敗しました: {e}")


def check_website_availability(url, check_interval_seconds):
    # プログラム実行ログ
    log_file = "website_monitor_log.txt"

    try:
        while True:
            response = requests.get(url)
            if response.status_code == 200:
                print(f"{url} は正常に応答しています。")
            else:
                alert_message = (
                    f"{url} が応答しない可能性があります（ステータスコード: {response.status_code}）。"
                )
                print(alert_message)
                with open(log_file, "a") as log:
                    log.write(f"{time.ctime()}: {alert_message}\n")

                send_slack_notification(slack_webhook_url, alert_message)

            time.sleep(check_interval_seconds)

    except Exception as e:
        print(f"エラーが発生しました: {e}")
        with open(log_file, "a") as log:
            log.write(f"{time.ctime()}: エラー - {e}\n")


website_url = input("監視したいウェブサイトのURL: ")
check_interval_seconds = int(input("監視の頻度（秒）: "))
slack_webhook_url = input("SlackのWebhook URL: ")

check_website_availability(website_url, check_interval_seconds)
