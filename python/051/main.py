import datetime
import os
import re


def generate_error_report(target_path, start_date, end_date):
    output_file = "error_report.txt"
    result_file = "result_log.txt"

    try:
        start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d")
        end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d")

        with open(output_file, "w") as report_file:
            report_file.write("エラーレポート:\n")

        with open(result_file, "w") as log:
            log.write("エラーレポート生成のログ:\n")

        for root, _, files in os.walk(target_path):
            for file in files:
                if file.lower().endswith(".log"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as log_file:
                            for line in log_file:
                                match = re.search(
                                    r"(\d{4}-\d{2}-\d{2} ([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]) - ERROR - (.*)",
                                    line,
                                )

                                if match:
                                    error_date = datetime.datetime.strptime(
                                        match.group(1), "%Y-%m-%d %H:%M:%S"
                                    )
                                    if start_date <= error_date <= end_date:
                                        error_message = match.group(3)
                                        with open(output_file, "a") as report_file:
                                            report_file.write(f"ファイル名: {file_path}\n")
                                            report_file.write(f"日時: {error_date}\n")
                                            report_file.write(
                                                f"エラーメッセージ: {error_message}\n\n"
                                            )

                        with open(result_file, "a") as log:
                            log.write(f"{file_path} の処理を実行しました\n")

                    except Exception as e:
                        with open(result_file, "a") as log:
                            log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

        print("エラーレポートを生成しました。")

    except Exception as e:
        print(f"エラーレポートの生成中にエラーが発生しました: {e}")


target_path = input("対象のディレクトリパスを入力: ")
start_date = input("検索開始日（YYYY-MM-DD）を入力: ")
end_date = input("検索終了日（YYYY-MM-DD）を入力: ")

generate_error_report(target_path, start_date, end_date)
