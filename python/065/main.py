import os
import shutil
import time
from datetime import datetime


def backup_and_cleanup(source_dir, backup_dir, backup_frequency_days, max_backup_files):
    # プログラム実行ログ
    log_file = "backup_log.txt"

    try:
        # バックアップディレクトリを作成
        if not os.path.exists(backup_dir):
            os.makedirs(backup_dir)

        # バックアップの実行
        timestamp = time.strftime("%Y%m%d%H%M%S")
        backup_subdir = os.path.join(backup_dir, f"backup_{timestamp}")
        shutil.copytree(source_dir, backup_subdir)
        with open(log_file, "a") as log:
            log.write(f"{datetime.now()} {source_dir}を{backup_subdir}にバックアップしました\n")

        # バックアップファイルのクリーンアップ
        backup_subdirs = sorted(os.listdir(backup_dir), reverse=True)
        if len(backup_subdirs) > max_backup_files:
            for old_backup in backup_subdirs[max_backup_files:]:
                old_backup_path = os.path.join(backup_dir, old_backup)
                shutil.rmtree(old_backup_path)
                print(f"古いバックアップを削除しました: {old_backup_path}")
                with open(log_file, "a") as log:
                    log.write(f"{datetime.now()} 古いバックアップを削除しました: {old_backup_path}\n")

        print("バックアップが完了しました。")

    except Exception as e:
        print(f"エラーが発生しました: {e}")
        with open(log_file, "a") as log:
            log.write(f"{datetime.now()} エラー: {e}\n")


source_directory = input("バックアップ対象のディレクトリパス: ")
backup_directory = input("バックアップを保存するディレクトリパス: ")
backup_frequency = int(input("バックアップの頻度（日数）: "))
max_backup_files = int(input("保持するバックアップファイルの最大数: "))

# 本番運用ではcronやAWS Lambda + Amazon EventBridgeで定期実行する
while True:
    backup_and_cleanup(
        source_directory,
        backup_directory,
        backup_frequency,
        max_backup_files,
    )

    # 動作確認用
    # time.sleep(backup_frequency)

    # バックアップ頻度を日数から秒に変換して指定する
    time.sleep(backup_frequency * 24 * 3600)
