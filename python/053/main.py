import os
import re


def extract_entries_with_keyword(target_path, keyword, output_file):
    result_log_file = "extract_entries_log.txt"

    entry_count = 0

    with open(output_file, "w") as output:
        output.write(f"キーワード '{keyword}' が含まれるエントリ:\n")

    with open(result_log_file, "w") as result:
        result.write("エントリ抽出のログ:\n")

    for root, _, files in os.walk(target_path):
        for file in files:
            if file.endswith(".log"):
                file_path = os.path.join(root, file)

                try:
                    with open(file_path, "r", encoding="utf-8") as file:
                        for line in file:
                            if re.search(keyword, line, re.IGNORECASE):
                                with open(output_file, "a") as output:
                                    output.write(f"ファイル名: {file_path}\n")
                                    output.write(f"エントリ: {line}\n")
                                entry_count += 1

                except Exception as e:
                    with open(result_log_file, "a") as result:
                        result.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

    with open(result_log_file, "a") as result:
        result.write(f"抽出したエントリの数: {entry_count}\n")

    print("エントリの抽出と保存が完了しました。")


target_path = input("対象のディレクトリパス: ")
keyword = input("検索するキーワード: ")
output_file = input("出力ファイル名: ")

extract_entries_with_keyword(target_path, keyword, output_file)
