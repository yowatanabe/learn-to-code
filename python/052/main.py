import os
import re


def generate_error_report(target_path):
    output_file = "error_report.txt"
    result_log_file = "error_report_log.txt"

    error_count = {}

    with open(output_file, "w") as report_file:
        report_file.write("エラーレポート:\n")

    with open(result_log_file, "w") as result_log:
        result_log.write("エラーレポート生成のログ:\n")

    for root, _, files in os.walk(target_path):
        for file in files:
            if file.endswith(".log"):
                file_path = os.path.join(root, file)

                try:
                    with open(file_path, "r", encoding="utf-8") as log_file:
                        for line in log_file:
                            match = re.search(
                                r"(\d{4}-\d{2}-\d{2} ([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]) - ERROR - (.*)",
                                line,
                            )
                            if match:
                                error_message = match.group(3)
                                if error_message in error_count:
                                    error_count[error_message] += 1
                                else:
                                    error_count[error_message] = 1

                    with open(result_log_file, "a") as result_log:
                        result_log.write(f"{file_path} の処理を実行しました\n")

                except Exception as e:
                    with open(result_log_file, "a") as result_log:
                        result_log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

    with open(output_file, "a") as report_file:
        report_file.write("エラーメッセージの発生回数:\n")
        for message, count in sorted(
            error_count.items(), key=lambda x: x[1], reverse=True
        ):
            report_file.write(f"{message}: {count}\n")

    print("エラーレポートを生成しました。")


target_path = input("対象のディレクトリパスを入力してください: ")

generate_error_report(target_path)
