import os
import re
from collections import defaultdict


def find_and_count_messages(log_directory, error_pattern):
    messages = defaultdict(int)

    try:
        for root, _, files in os.walk(log_directory):
            for filename in files:
                if filename.endswith(".log"):
                    file_path = os.path.join(root, filename)
                    with open(file_path, "r") as file:
                        for line in file:
                            match = re.search(error_pattern, line)
                            if match:
                                message = match.group()
                                messages[message] += 1

        if messages:
            print("メッセージの集計結果:")
            for message, count in messages.items():
                print(f"{message}: {count}回")

    except Exception as e:
        print(f"エラーが発生しました: {e}")
        return None


log_directory = input("ログファイルを検索するディレクトリのパス: ")
error_pattern = input("メッセージを検出するための正規表現パターン: ")

find_and_count_messages(log_directory, error_pattern)
