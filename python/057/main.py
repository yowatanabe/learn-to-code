import os
import zipfile


def archive_files_with_keyword(target_path, keyword, output_directory):
    # プログラムの実行ログ
    log_file = "archive_log.txt"

    # アーカイブを保存するディレクトリが存在しなければ作成する
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    try:
        matching_files = []

        with open(log_file, "w") as log:
            log.write("処理のログ:\n")

        for root, _, files in os.walk(target_path):
            for file in files:
                if file.endswith(".txt"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as text_file:
                            content = text_file.read()
                            if keyword in content:
                                matching_files.append(file_path)

                    except Exception as e:
                        with open(log_file, "a") as log:
                            log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

        if matching_files:
            output_zip = os.path.join(output_directory, "matched_files.zip")
            with zipfile.ZipFile(output_zip, "w") as zipf:
                for file_path in matching_files:
                    zipf.write(file_path, os.path.basename(file_path))

            with open(log_file, "a") as log:
                log.write(f"{file_path} をアーカイブしました\n")

            print("アーカイブが完了しました。")

        else:
            print("該当ファイルは見つかりませんでした。")

    except Exception as e:
        print(f"処理中にエラーが発生しました: {e}")


target_path = input("対象のディレクトリパス: ")
keyword = input("検索するキーワード: ")
output_directory = input("アーカイブを保存するディレクトリパス: ")


archive_files_with_keyword(target_path, keyword, output_directory)
