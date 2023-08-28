import os
import time


def watch_file_for_keyword(file_path, keyword, interval):
    try:
        last_size = 0

        while True:
            if os.path.exists(file_path):
                current_size = os.path.getsize(file_path)
                if current_size > last_size:
                    with open(file_path, "r") as file:
                        file_contents = file.read()
                        print(file_contents)
                        if keyword in file_contents:
                            print(f"キーワード '{keyword}' がファイル内で見つかりました")
                    last_size = current_size

            time.sleep(interval)

    except Exception as e:
        print(f"エラーが発生しました: {e}")


file_path = input("監視対象のファイルのパス: ")
keyword = input("検出したいキーワード: ")
interval = int(input("ファイルを定期的にチェックする間隔（秒）: "))

watch_file_for_keyword(file_path, keyword, interval)
