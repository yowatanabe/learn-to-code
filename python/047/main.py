import os


def count_errors_in_logs(directory_path, keyword):
    result_log_file_path = "error_count_log.txt"

    try:
        error_count = 0

        with open(result_log_file_path, "w") as result_log_file:
            result_log_file.write("エラーカウントのログ:\n")

        for root, _, files in os.walk(directory_path):
            for file in files:
                if file.endswith(".log"):
                    log_file_path = os.path.join(root, file)

                    try:
                        with open(log_file_path, "r") as log_file:
                            for line in log_file:
                                if keyword.lower() in line.lower():
                                    error_count += 1

                        with open(result_log_file_path, "a") as result_log_file:
                            result_log_file.write(
                                f"{log_file_path} からエラーカウントを集計しました。\n"
                            )

                    except Exception as e:
                        with open(result_log_file_path, "a") as result_log_file:
                            result_log_file.write(
                                f"{log_file_path} のエラーカウント集計に失敗しました: {e}\n"
                            )

        print(f"エラーカウント: {error_count}")

    except Exception as e:
        print(f"エラーが発生しました: {e}")


directory_path = input("対象のディレクトリパスを入力してください: ")
keyword = input("検索するキーワードを入力してください: ")

count_errors_in_logs(directory_path, keyword)
