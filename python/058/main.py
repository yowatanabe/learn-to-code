import json
import os
import re


def count_words_in_files(target_dir, output_json):
    log_file = "word_count_log.txt"

    try:
        word_count = {}

        with open(log_file, "w") as log:
            log.write("処理のログ:\n")

        for root, _, files in os.walk(target_dir):
            for file in files:
                if file.endswith(".txt"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as text_file:
                            content = text_file.read()
                            words = re.findall(r"\b\w+\b", content.lower())
                            for word in words:
                                if word in word_count:
                                    word_count[word] += 1
                                else:
                                    word_count[word] = 1

                        with open(log_file, "a") as log:
                            log.write(f"{file_path} の処理を実行しました\n")

                    except Exception as e:
                        with open(log_file, "a") as log:
                            log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

        with open(output_json, "w", encoding="utf-8") as json_file:
            json.dump(word_count, json_file, indent=4)

        print("英単語のカウントとJSONファイルの保存が完了しました。")

    except Exception as e:
        print(f"処理中にエラーが発生しました: {e}")


target_dir = input("対象のディレクトリパス: ")
output_json = input("出力JSONファイル名: ")

count_words_in_files(target_dir, output_json)
