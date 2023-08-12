import os


def replace_strings(target_dir, search, replace):
    # 実行結果ログ
    result_log = "replace_log.txt"

    with open(result_log, "w") as rl:
        rl.write("置換結果のログ:\n")

    # 置換処理
    for root, _, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".txt"):
                file_path = os.path.join(root, file)

                try:
                    with open(file_path, "r", encoding="utf-8") as input_lines:
                        lines = input_lines.readlines()

                    with open(file_path, "w", encoding="utf-8") as replace_file:
                        for line in lines:
                            replaced_line = line.replace(search, replace)
                            replace_file.write(replaced_line)

                    with open(result_log, "a") as rl:
                        rl.write(f"{file_path}で置換を実行しました。\n")

                except Exception as e:
                    with open(result_log, "a") as rl:
                        rl.write(f"{file_path}の置換に失敗しました: {e}\n")

    print("処理完了")


target_dir = input("対象のディレクトリ: ")
search = input("検索文字列: ")
replace = input("置換文字列: ")

replace_strings(target_dir, search, replace)
