import configparser
import os
from datetime import datetime

# 設定ファイルを読み込む
config = configparser.ConfigParser()
config.read("config.ini")

log_directory = config["config"]["log_directory"]
max_age_days = int(config["config"]["max_age_days"])

# 現在の日付を取得
current_date = datetime.now()

# ログファイル一覧を取得
log_files = os.listdir(log_directory)

for log_file in log_files:
    file_path = os.path.join(log_directory, log_file)

    # ファイルの最終更新日時を取得
    file_mtime = datetime.fromtimestamp(os.path.getmtime(file_path))

    # 最終更新日時から経過した日数を計算
    days_difference = (current_date - file_mtime).days

    if days_difference > max_age_days:
        # 最大保存日数を超えたファイルを削除
        os.remove(file_path)
        print(f"{file_path}を削除しました。")
