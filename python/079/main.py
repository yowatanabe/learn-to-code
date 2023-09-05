import random
import time

threshold = float(input("応答時間のしきい値（秒）: "))
interval = int(input("リクエストの監視間隔（秒単位）: "))
log_file_path = "response_times.log"


def log_response_time(request_time, response_time):
    """ログデータをフォーマットしてファイルに書き込む"""

    with open(log_file_path, "a") as log_file:
        log_entry = f"Request Time: {request_time}, Response Time: {response_time}\n"
        log_file.write(log_entry)


def check_response_time(request_time):
    """応答時間を計算（仮のランダムな応答時間を生成）"""

    # 0.5秒から2.5秒までのランダムな応答時間
    response_time = random.uniform(0.5, 2.5)

    # 応答時間がしきい値を超えた場合に警告メッセージを生成
    if response_time > threshold:
        warning_message = f"警告: 応答時間がしきい値を超えました ({response_time}秒)"
        print(warning_message)

    # レスポンス時間をログに記録
    log_response_time(request_time, response_time)


def main():
    while True:
        request_time = time.strftime("%Y-%m-%d %H:%M:%S")
        check_response_time(request_time)
        time.sleep(interval)


if __name__ == "__main__":
    main()
