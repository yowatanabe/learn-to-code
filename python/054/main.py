import os
import shutil


def copy_files_with_keyword(target_dir, keyword, output_dir):
    # プログラム実行ログ
    log_file = "copy_files_log.txt"

    try:
        # 出力先ディレクトリが存在しなければ作成する
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)

        copied_file_count = 0

        with open(log_file, "w") as log:
            log.write("ファイルコピーのログ:\n")

        for root, _, files in os.walk(target_dir):
            for file in files:
                if file.endswith(".txt"):
                    file_path = os.path.join(root, file)

                    try:
                        with open(file_path, "r", encoding="utf-8") as text_file:
                            content = text_file.read()
                            if keyword in content:
                                output_file_path = os.path.join(output_dir, file)
                                shutil.copy2(file_path, output_file_path)
                                copied_file_count += 1

                    except Exception as e:
                        with open(log_file, "a") as log:
                            log.write(f"{file_path} の処理中にエラーが発生しました: {e}\n")

        with open(log_file, "a") as log:
            log.write(f"コピーされたファイルの数: {copied_file_count}\n")

        if copied_file_count == 0:
            print("ファイルコピーはコピーされませんでした。")
        else:
            print("ファイルコピーが完了しました。")

    except Exception as e:
        print(f"プログラム実行エラー: {e}")


target_dir = input("対象のディレクトリパス: ")
keyword = input("重要なキーワード: ")
output_dir = input("出力先のディレクトリ: ")

copy_files_with_keyword(target_dir, keyword, output_dir)
