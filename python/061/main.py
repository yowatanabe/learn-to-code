import csv
import os
import re


def extract_date_time_from_files(target_dir, output_csv):
    log_file = "date_time_extraction_log.txt"

    try:
        date_time_list = []

        with open(log_file, "w") as log:
            log.write("処理のログ:\n")

        date_time_pattern = r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}"

        for root, _, files in os.walk(target_dir):
            for file in files:
                if file.endswith(".txt"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as text_file:
                            content = text_file.read()
                            matches = re.findall(date_time_pattern, content)
                            if matches:
                                for match in matches:
                                    date, time = match.split()
                                    date_time_list.append([date, time])

                                with open(log_file, "a") as log:
                                    log.write(f"{file_path} の処理を実行しました\n")

                    except Exception as e:
                        with open(log_file, "a") as log:
                            log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

        if date_time_list:
            with open(output_csv, "w", newline="", encoding="utf-8") as csv_file:
                csv_writer = csv.writer(csv_file)
                csv_writer.writerow(["日付", "時間"])
                csv_writer.writerows(date_time_list)

            print("日付と時間の情報がCSVファイルに保存されました。")

        else:
            print("日付と時間の情報は見つかりませんでした。")

    except Exception as e:
        print(f"処理中にエラーが発生しました: {e}")


target_dir = input("対象のディレクトリパス: ")
output_csv = input("出力CSVファイル名: ")

extract_date_time_from_files(target_dir, output_csv)
