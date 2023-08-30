import os
from datetime import datetime


def delete_old_file(directory, max_age_days):
    # プログラム実行ログ
    log_file = "cleanup_log.txt"

    # 現在の日付を取得
    current_date = datetime.now()

    # ログファイルを作成または追記モードで開く
    with open(log_file, "a") as log:
        log.write(f"Cleaning up old files in {directory} directory...\n")

    # ディレクトリ内のファイルをループで処理
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)

        # ファイルの最終更新日時を取得
        file_mtime = datetime.fromtimestamp(os.path.getmtime(filepath))

        # 現在の日付との差分を計算し、指定した日数よりも古い場合は削除
        age = current_date - file_mtime
        if age.days > max_age_days:
            os.remove(filepath)
            with open(log_file, "a") as log:
                log.write(f"Deleted file: {filename} ({file_mtime})\n")


directory = input("監視対象ディレクトリを指定: ")
max_age_days = int(input("保存期間（日数）を指定: "))

delete_old_file(directory, max_age_days)
