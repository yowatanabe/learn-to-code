import re
import time


# アラートを送信する関数
def send_alert(message):
    print(f"アラート: {message}")


# ログファイルを監視する関数
def monitor_log_file(log_file_path):
    # ログファイルを開いて最初の位置を記憶
    with open(log_file_path, "r") as log_file:
        # ファイルの末尾に移動
        log_file.seek(0, 2)

        while True:
            where = log_file.tell()
            line = log_file.readline()
            if not line:
                time.sleep(1)
                log_file.seek(where)
            else:
                # エラーメッセージを検出する正規表現パターン
                error_pattern = r".*error.*"
                if re.search(error_pattern, line, re.IGNORECASE):
                    send_alert("新しいエラーがログファイルに記録されました")


log_file_path = input("監視対象のログファイル: ")
monitor_log_file(log_file_path)
