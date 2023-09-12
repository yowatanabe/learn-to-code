import os
import shutil
import zipfile
from datetime import datetime, timedelta


def backup_dir_to_zip(source_dir, backup_dir, backup_frequency, backup_retention_days):
    # 現在の日付を取得
    current_date = datetime.now()

    # バックアップの名前を生成
    backup_name = current_date.strftime("%Y-%m-%d")

    # バックアップを保存するディレクトリを作成
    backup_path = os.path.join(backup_dir, backup_name)
    os.makedirs(backup_path)

    # バックアップ対象のファイルをZIPアーカイブに圧縮
    with zipfile.ZipFile(os.path.join(backup_path, "backup.zip"), "w") as backup_zip:
        for root, _, files in os.walk(source_dir):
            for file in files:
                file_path = os.path.join(root, file)
                backup_zip.write(file_path, os.path.relpath(file_path, source_dir))

    # 古いバックアップを削除
    if backup_frequency == "daily":
        retention_period = timedelta(days=backup_retention_days)
    elif backup_frequency == "weekly":
        retention_period = timedelta(weeks=backup_retention_days)
    elif backup_frequency == "monthly":
        retention_period = timedelta(
            # 単純化のため、1ヶ月を30日として計算
            days=backup_retention_days
            * 30
        )

    for item in os.listdir(backup_dir):
        item_path = os.path.join(backup_dir, item)
        if os.path.isdir(item_path):
            try:
                item_date = datetime.strptime(item, "%Y-%m-%d")
                if current_date - item_date > retention_period:
                    shutil.rmtree(item_path)
            except ValueError:
                # バックアップ名以外のフォルダは無視
                pass

    # ログを記録
    log_file = "backup.log"
    with open(log_file, "a") as log:
        log.write(f"Backup completed on {current_date.strftime('%Y-%m-%d %H:%M:%S')}\n")


source_dir = input("バックアップ対象のディレクトリ: ")
backup_dir = input("バックアップを保存するディレクトリ: ")
backup_frequency = input("バックアップの頻度（daily | weekly | monthly）: ")
backup_retention_days = int(input("バックアップを保持する期間（例: 7 = 7日間）: "))

backup_dir_to_zip(source_dir, backup_dir, backup_frequency, backup_retention_days)
