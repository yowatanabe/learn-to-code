import csv
import os


def extract_and_save_to_csv(directory_path, keyword, csv_file_name):
    log_file_path = "search_log.txt"

    try:
        with open(csv_file_name, "w", newline="") as csv_file:
            csv_writer = csv.writer(csv_file)
            csv_writer.writerow(["ファイル名", f"キーワード:{keyword} を含む行"])

        with open(log_file_path, "w") as log_file:
            log_file.write("検索結果のログ:\n")

        for root, _, files in os.walk(directory_path):
            for file in files:
                if file.endswith(".txt"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as input_file:
                            for line in input_file:
                                if keyword.lower() in line.lower():
                                    with open(
                                        csv_file_name, "a", newline=""
                                    ) as csv_file:
                                        csv_writer = csv.writer(csv_file)
                                        csv_writer.writerow([file, line.strip()])

                            with open(log_file_path, "a") as log_file:
                                log_file.write(
                                    f"{file_path} からキーワード '{keyword}' の検索を実行しました。\n"
                                )

                    except Exception as e:
                        with open(log_file_path, "a") as log_file:
                            log_file.write(f"{file_path} の検索に失敗しました: {e}\n")

        print(f"検索結果を {csv_file_name} に保存しました。")

    except Exception as e:
        print(f"エラーが発生しました: {e}")


directory_path = input("対象のディレクトリパスを入力: ")
keyword = input("検索するキーワードを入力: ")
csv_file_name = input("CSVファイル名を入力: ")

extract_and_save_to_csv(directory_path, keyword, csv_file_name)
