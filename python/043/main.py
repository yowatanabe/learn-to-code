import os


def merge_text_files(target_folder):
    # ログファイル名
    merged_file = "merged.txt"
    result_log_file_name = "merge_log.txt"

    # プログラム実行ログファイルのヘッダー
    with open(result_log_file_name, "w") as tlfn:
        tlfn.write("ファイルの結合が行われたログ:\n")

    # 結合処理
    merged_file_path = os.path.join(target_folder, merged_file)

    with open(merged_file_path, "w") as mfp:
        for filename in os.listdir(target_folder):
            # プログラム実行ログファイル以外の.txtファイルを対象とする
            if filename.endswith(".txt") and filename != merged_file:
                file_path = os.path.join(target_folder, filename)
                with open(file_path, "r") as fp:
                    content = fp.read()
                    mfp.write(content)
                    mfp.write("\n")

                with open(result_log_file_name, "a") as rlfn:
                    rlfn.write(f"{file_path} を結合しました。\n")

    print("テキストファイルの結合完了")


target_folder = input("結合対象のフォルダ: ")
merge_text_files(target_folder)
