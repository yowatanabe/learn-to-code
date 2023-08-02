import os
import shutil
import time


def directory_backup(src_dir, dst_dir, backup_interval_in_seconds):
    # バックアップ先のディレクトリが存在しない場合は、自動的に作成
    if not os.path.exists(dst_dir):
        os.makedirs(dst_dir)

    while True:
        try:
            # バックアップ元のディレクトリ内のファイルを取得
            files = os.listdir(src_dir)

            # ファイルをバックアップ先にバックアップ
            for file in files:
                src_file_path = os.path.join(src_dir, file)
                dst_file_path = os.path.join(dst_dir, file)

                # バックアップ先に同名のファイルが存在しない場合、またはバックアップ元のファイルの方が新しい場合にコピー
                if not os.path.exists(dst_file_path) or os.path.getmtime(
                    src_file_path
                ) > os.path.getmtime(dst_file_path):
                    shutil.copy2(src_file_path, dst_file_path)

            print(
                f"バックアップが完了しました。次回のバックアップまで待機します... (間隔: {backup_interval_in_seconds}秒)"
            )
            time.sleep(backup_interval_in_seconds)

        except FileNotFoundError:
            print("バックアップ元のディレクトリが見つかりませんでした。")
            return


src_dir = input("バックアップ元のディレクトリを指定してください: ")
dst_dir = input("バックアップ先のディレクトリを指定してください: ")
backup_interval_in_seconds = int(input("バックアップの間隔（秒単位）を指定してください: "))

directory_backup(src_dir, dst_dir, backup_interval_in_seconds)
