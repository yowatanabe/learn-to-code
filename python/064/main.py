import time

from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer


class NewFileHandler(FileSystemEventHandler):
    def __init__(self, directory, log_file):
        self.directory = directory
        self.log_file = log_file

    def on_created(self, event):
        # ディレクトリの変更は無視
        if event.is_directory:
            return

        new_file_path = event.src_path
        print(f"新しいファイルが追加されました: {new_file_path}")
        with open(self.log_file, "a") as log:
            log.write(f"{new_file_path}\n")


def monitor_directory(target_dir):
    # プログラム実行ログ
    log_file = "monitoring_log.txt"

    try:
        event_handler = NewFileHandler(target_dir, log_file)
        observer = Observer()
        observer.schedule(event_handler, path=target_dir, recursive=False)
        observer.start()

        print(f"ディレクトリの変更を監視中: {target_dir}")

        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            observer.stop()

        observer.join()

    except Exception as e:
        print(f"監視中にエラーが発生しました: {e}")
        with open(log_file, "a") as log:
            log.write(f"エラー: {e}\n")


target_dir = input("監視対象のディレクトリパスを入力してください: ")

monitor_directory(target_dir)
