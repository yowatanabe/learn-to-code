import csv
import json
import os


def aggregate_values_to_csv(target_dir, key_name):
    # 集計結果のログ
    output_csv = "aggregated_values.csv"
    # プログラム処理結果のログ
    log_file = "aggregate_values_log.txt"

    # ログのヘッダー
    with open(output_csv, "w", newline="") as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerow(["ファイル名", key_name + "の値"])

    with open(log_file, "w") as log:
        log.write("処理のログ:\n")

    # 集計処理
    for root, _, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".json"):
                file_path = os.path.join(root, file)

                try:
                    with open(file_path, "r", encoding="utf-8") as json_file:
                        data = json.load(json_file)
                        if key_name in data:
                            key_value = data[key_name]
                            with open(output_csv, "a", newline="") as csv_file:
                                csv_writer = csv.writer(csv_file)
                                csv_writer.writerow([file_path, key_value])

                            with open(log_file, "a") as log:
                                log.write(f"{file_path} の処理に成功しました\n")

                except Exception as e:
                    with open(log_file, "a") as log:
                        log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

    print("CSVファイルへの集計が完了しました。")


target_dir = input("対象のディレクトリパスを入力してください: ")
key_name = input("集計するキー名を入力してください: ")

aggregate_values_to_csv(target_dir, key_name)
