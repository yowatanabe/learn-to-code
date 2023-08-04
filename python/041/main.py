import os
import time
from datetime import datetime

import requests


def check_add_new_file(monitored_dir_path, slack_webhook_url, interval):
    new_files = []
    for file in os.listdir(monitored_dir_path):
        file_path = os.path.join(monitored_dir_path, file)
        if os.path.isfile(file_path):
            file_info = {
                "file_name": file,
                "created_time": time.ctime(os.path.getctime(file_path)),
                "file_size": os.path.getsize(file_path),
            }
            new_files.append(file_info)

    if new_files:
        message = (
            f"監視対象のディレクトリ: {os.path.abspath(monitored_dir_path)}\n"
            f"確認日時: {datetime.now()}\n"
            f"{len(new_files)}件のファイルがあります\n"
        )
        for file_info in new_files:
            message += f"ファイル名: {file_info['file_name']}, 作成日時: {file_info['created_time']}, ファイルサイズ: {file_info['file_size']} bytes\n"

        send_slack_notification(slack_webhook_url, message)


def send_slack_notification(slack_webhook_url, message):
    payload = {"text": message}
    try:
        response = requests.post(slack_webhook_url, json=payload)
        response.raise_for_status()
        print("Slackに通知しました。")
    except requests.exceptions.RequestException as e:
        print(f"Slack通知に失敗しました: {e}")


monitored_dir_path = input("監視するディレクトリのパスを入力: ")
slack_webhook_url = input("SlackのWebhook URLを入力: ")
interval = int(input("監視間隔(秒)を入力: "))

while True:
    check_add_new_file(monitored_dir_path, slack_webhook_url, interval)
    time.sleep(interval)
