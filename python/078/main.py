import re
import sys
import time

# 既知のエラーメッセージを記録するセット
known_errors = set()


def monitor_log(log_file_path):
    try:
        with open(log_file_path, "r") as log_file:
            while True:
                # ログファイルを監視し、新しいエラーメッセージを検出
                line = log_file.readline()
                if not line:
                    time.sleep(1)  # ファイルに新しい行が追加されるのを待つ
                    continue

                # エラーメッセージの正規表現パターン
                error_pattern = r"\[ERROR\] (.+)"
                match = re.search(error_pattern, line)
                if match:
                    error_message = match.group(1)
                    # 重複しないエラーメッセージの場合に通知
                    if error_message not in known_errors:
                        known_errors.add(error_message)
                        send_notification(error_message)
    except Exception as e:
        print(f"エラー: {str(e)}")


def send_notification(error_message):
    print(f"新しいエラーが検出されました: {error_message}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("ログファイルのパスを指定してください。")
    else:
        log_file_path = sys.argv[1]
        monitor_log(log_file_path)
