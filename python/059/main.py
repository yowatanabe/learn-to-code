import csv
import os


def search_and_save_files(target_path, pattern, output_csv):
    log_file = "search_log.txt"

    matching_files = []

    with open(log_file, "w") as log:
        log.write("処理のログ:\n")

    for root, _, files in os.walk(target_path):
        for file in files:
            if file.endswith(".txt"):
                file_path = os.path.join(root, file)

                try:
                    with open(file_path, "r", encoding="utf-8") as text_file:
                        content = text_file.read()
                        if pattern in content:
                            matching_files.append(file)

                            with open(log_file, "a") as log:
                                log.write(f"{file_path} の処理を実行しました\n")

                except Exception as e:
                    with open(log_file, "a") as log:
                        log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

    if matching_files:
        with open(output_csv, "w", newline="", encoding="utf-8") as csv_file:
            csv_writer = csv.writer(csv_file)
            csv_writer.writerow(["ファイル名"])
            for file in matching_files:
                csv_writer.writerow([file])

        print("一致するファイルの一覧がCSVファイルに保存されました。")

    else:
        print("一致するファイルは見つかりませんでした。")


target_path = input("対象のディレクトリパス: ")
pattern = input("検索する文字列パターン: ")
output_csv = input("保存CSVファイル名: ")

search_and_save_files(target_path, pattern, output_csv)
