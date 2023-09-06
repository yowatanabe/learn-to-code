import concurrent.futures
import time

import requests


def log_alert(service_name, error_message):
    # アラートデータをフォーマットしてファイルに書き込む
    with open(alert_file_path, "a") as alert_file:
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
        alert_entry = (
            f"Timestamp: {timestamp}, Service: {service_name}, Error: {error_message}\n"
        )
        alert_file.write(alert_entry)


def check_service_health(service_config):
    while True:
        try:
            response = requests.get(service_config["endpoint"])
            response.raise_for_status()
        except requests.exceptions.RequestException as e:
            # エラーメッセージを生成してアラートを発生
            error_message = f"HTTPエラー: {e}"
            log_alert(service_config["name"], error_message)

        time.sleep(service_config["interval"])


def main():
    # 複数のサービスを同時に監視
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=len(service_configs)
    ) as executor:
        for service_config in service_configs:
            executor.submit(check_service_health, service_config)


# 設定ファイルからサービスのエンドポイントと監視間隔を読み込む
service_configs = [
    {
        "name": "Service A",
        "endpoint": "http://localhost:8080/test1",
        "interval": 10,
    },
    {
        "name": "Service B",
        "endpoint": "http://localhost:8080/test2",
        "interval": 5,
    },
]
alert_file_path = "alerts.txt"

main()
