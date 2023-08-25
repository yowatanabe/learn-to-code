import os
import shutil
import time
from datetime import datetime

from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer


class NewFileHandler(FileSystemEventHandler):
    def __init__(self, source_dir, dest_dir, file_extension, log_file):
        self.source_dir = source_dir
        self.dest_dir = dest_dir
        self.file_extension = file_extension
        self.log_file = log_file

    def on_created(self, event):
        # ディレクトリの変更は無視
        if event.is_directory:
            return

        new_file_path = event.src_path
        _, ext = os.path.splitext(new_file_path)

        if ext.lower() == self.file_extension.lower():
            print(f"新しいファイルが追加されました: {new_file_path}")
            dest_path = os.path.join(self.dest_dir, os.path.basename(new_file_path))
            shutil.copy(new_file_path, dest_path)
            print(f"ファイルをコピーしました: {dest_path}")
            with open(self.log_file, "a") as log:
                log.write(f"{datetime.now()} ファイルをコピーしました: {dest_path}")


def monitor_and_copy_files(source_directory, dest_directory, file_extension):
    # プログラム実行ログ
    log_file = "copy_log.txt"

    try:
        if not os.path.exists(dest_directory):
            os.makedirs(dest_directory)

        event_handler = NewFileHandler(
            source_directory, dest_directory, file_extension, log_file
        )
        observer = Observer()
        observer.schedule(event_handler, path=source_directory, recursive=False)
        observer.start()

        print(f"ディレクトリの変更を監視中: {source_directory}")

        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            observer.stop()

        observer.join()

    except Exception as e:
        print(f"監視中にエラーが発生しました: {e}")
        with open(log_file, "w") as log:
            log.write(f"{datetime.now()} エラー: {e}")


source_directory = input("監視対象のディレクトリパス: ")
dest_directory = input("コピー先のディレクトリパス: ")
file_extension = input("監視対象のファイル拡張子 (例: .txt): ")

monitor_and_copy_files(source_directory, dest_directory, file_extension)
monitor_and_copy_files(source_directory, dest_directory, file_extension)
