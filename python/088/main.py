import time


def monitor_log_file(log_file_path):
    try:
        with open(log_file_path, "r") as log_file:
            # ファイルの最後に移動
            log_file.seek(0, 2)

            while True:
                line = log_file.readline()
                if not line:
                    # 1秒ごとにファイルをチェック
                    time.sleep(1)
                    continue

                if "ERROR" in line:
                    handle_error(line)

    except Exception as e:
        print(f"エラー: {str(e)}")


def handle_error(log_entry):
    # エラーログエントリをコンソールに通知
    print(f"エラーが検出されました: {log_entry}", end="")


log_file_path = input("監視対象のログファイルパス: ")
monitor_log_file(log_file_path)
