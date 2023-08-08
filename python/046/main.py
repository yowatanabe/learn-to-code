import os


def extract_error_logs(dir_path, keyword):
    try:
        # 各ログファイル名
        output_file_path = "error_report.txt"
        result_log_path = "extraction_log.txt"

        # プログラム実行ログのヘッダー
        with open(result_log_path, "w") as log_file:
            log_file.write("エラーログの抽出とレポート作成のログ:\n")

        # ログファイルからエラーログ抽出
        with open(output_file_path, "w") as output_file:
            for root, _, files in os.walk(dir_path):
                for file in files:
                    if file.endswith(".log"):
                        log_file_path = os.path.join(root, file)

                        try:
                            with open(log_file_path, "r") as log_file:
                                for line in log_file:
                                    if keyword in line:
                                        output_file.write(line)

                            with open(result_log_path, "a") as log_file:
                                log_file.write(f"{log_file_path} からエラーログを抽出しました。\n")

                        except Exception as e:
                            with open(result_log_path, "a") as log_file:
                                log_file.write(
                                    f"{log_file_path} のエラーログ抽出に失敗しました: {e}\n"
                                )

        print(f"エラーレポートを {output_file_path} に保存しました。")

    except Exception as e:
        print(f"エラーが発生しました: {e}")


dir_path = input("対象のディレクトリパスを入力: ")
keyword = input("エラーを特定するためのキーワードを入力: ")

extract_error_logs(dir_path, keyword)
