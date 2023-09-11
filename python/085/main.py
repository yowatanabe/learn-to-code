import os


def check_log_files(log_directory, keyword, output_file):
    # エラーメッセージを格納するためのリスト
    error_messages = []

    # ディレクトリ内のすべてのファイルを検索
    for root, _, files in os.walk(log_directory):
        for file in files:
            if file.endswith(".log"):
                file_path = os.path.join(root, file)
                with open(file_path, "r") as log_file:
                    for line in log_file:
                        if line.startswith(keyword):
                            error_messages.append(line.strip())

    # エラーメッセージをファイルに書き込み
    with open(output_file, "w") as output:
        for error in error_messages:
            output.write(error + "\n")

    print(f"Total error messages found: {len(error_messages)}")


log_directory = input("特定のディレクトリを指定: ")
keyword = input("検索メッセージ: ")
output_file = input("エラーメッセージを格納するファイル: ")

check_log_files(log_directory, keyword, output_file)
