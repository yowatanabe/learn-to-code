import csv
import json
import os

output_csv_file_name = "output.csv"
output_result_file_name = "conversion_log.txt"


def convert_json_to_csv(folder_path):
    try:
        # フォルダの存在確認
        if not os.path.isdir(folder_path):
            raise Exception("指定したフォルダが存在しませんでした。")

        # CSVファイル
        output_csv_file_path = os.path.join(folder_path, output_csv_file_name)

        # プログラム実行ログのヘッダー
        with open(output_result_file_name, "w") as orfn:
            orfn.write("JSONからCSVへの変換のログ:\n")

        # JsonからCSVへの変換処理
        with open(output_csv_file_path, "w") as ocfp:
            csv_writer = csv.writer(ocfp)
            csv_writer.writerow(["name", "age"])

            for root, _, files in os.walk(folder_path):
                for file in files:
                    if file.endswith(".json"):
                        json_file_path = os.path.join(root, file)

                        try:
                            with open(json_file_path, "r") as jfp:
                                data = json.load(jfp)
                                name = data.get("name")
                                age = data.get("age")

                                if name and age:
                                    csv_writer.writerow([name, age])

                                    with open(output_result_file_name, "a") as orfn:
                                        orfn.write(
                                            f"{json_file_path} の情報をCSVに変換しました。\n"
                                        )
                        except Exception as e:
                            with open(output_result_file_name, "a") as orfn:
                                orfn.write(f"{json_file_path} の変換に失敗しました: {e}\n")

        print("JSONからCSVへの変換が完了しました。")

    except Exception as e:
        print(f"エラーが発生しました: {e}")


folder_path = input("JSONファイルがあるフォルダのパス: ")
convert_json_to_csv(folder_path)
