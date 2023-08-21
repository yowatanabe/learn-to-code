import os
import re
from collections import Counter


def extract_and_count_errors(target_dir):
    # 抽出結果を保存するファイル
    output_file = "most_common_error.txt"

    # プログラム実行結果を保存するファイル
    log_file = "error_extraction_log.txt"

    # 抽出条件
    pattern = r"\[ERROR\]|Error:"

    try:
        error_messages = []

        with open(log_file, "w") as log:
            log.write("処理のログ:\n")

        for root, _, files in os.walk(target_dir):
            for file in files:
                if file.endswith(".log"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as target_log_file:
                            content = target_log_file.read()
                            matches = re.findall(pattern, content)
                            error_messages.extend(matches)

                            if matches:
                                with open(log_file, "a") as log:
                                    log.write(f"{file_path} からエラーメッセージを抽出しました\n")
                            else:
                                with open(log_file, "a") as log:
                                    log.write(f"{file_path} にエラーメッセージはありませんでした\n")

                    except Exception as e:
                        with open(log_file, "a") as log:
                            log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

        if error_messages:
            error_counts = Counter(error_messages)
            most_common_error, most_common_count = error_counts.most_common(1)[0]

            with open(output_file, "w", encoding="utf-8") as output:
                output.write(f"最も頻繁に発生するエラーメッセージ: {most_common_error}\n")
                output.write(f"出現回数: {most_common_count}\n")

            print("エラーメッセージのカウントと最も頻繁なエラーメッセージの特定が完了しました。")

        else:
            print("エラーメッセージは見つかりませんでした。")

    except Exception as e:
        print(f"処理中にエラーが発生しました: {e}")


target_dir = input("対象のディレクトリパスを入力してください: ")
extract_and_count_errors(target_dir)
