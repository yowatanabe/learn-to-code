import re
import time


def check_error_messages(log_file_path, error_pattern, monitoring_interval):
    # 監視を開始する時間
    start_time = time.time()

    # すでに通知したエラーメッセージを格納するセット
    notified_errors = set()

    while True:
        try:
            # ログファイルを開く
            with open(log_file_path, "r") as log_file:
                # ログファイルを行ごとに読み込む
                for line in log_file:
                    match = error_pattern.search(line)
                    if match:
                        error_message = match.group(1)
                        if error_message not in notified_errors:
                            # 新しいエラーメッセージが検出された場合、通知する
                            print(f"New error detected: {error_message}")
                            notified_errors.add(error_message)

            # 指定した監視間隔だけ待つ
            time.sleep(
                monitoring_interval - ((time.time() - start_time) % monitoring_interval)
            )

        except KeyboardInterrupt:
            # Ctrl+Cでプログラムを終了
            print("Monitoring stopped.")
            break


log_file_path = input("監視するログファイルのパス: ")
error_pattern = re.compile(r"ERROR: (.+)")
monitoring_interval = int(input("定期的な監視間隔（秒）: "))

check_error_messages(log_file_path, error_pattern, monitoring_interval)
