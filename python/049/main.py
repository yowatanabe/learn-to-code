import os
import re


def search_matching_pattern(target_dir, pattern):
    for root, _, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".txt"):
                file_path = os.path.join(root, file)

                with open(file_path, "r") as file_path:
                    for n, line in enumerate(file_path, start=1):
                        if re.search(pattern, line):
                            print(f"ファイル名:{file}, 行番号:{n}, 内容:{line.strip()}")


target_dir = input("検索対象のディレクトリ: ")
pattern = input("検索する正規表現パターン: ")

search_matching_pattern(target_dir, pattern)
