import os
import time


def old_file_automatically_regularly_deletion(
    target_dir, effective_date, result_log_file
):
    current_time = time.time()

    try:
        # 対象ディレクトリ内の全てのファイルを取得
        files = os.listdir(target_dir)

        # 有効期限が過ぎているファイルを削除
        for file in files:
            file_path = os.path.join(target_dir, file)
            file_age_seconds = current_time - os.path.getmtime(file_path)
            file_age_days = file_age_seconds / (60 * 60 * 24)

            if file_age_days > effective_date:
                os.remove(file_path)

                # 削除したファイルの名前をログファイルに追越
                with open(result_log_file, "a") as log_file:
                    log_file.write(f"{file} - 削除日時: {time.ctime()}\n")

        print("古いファイルを削除しました。")

    except FileNotFoundError:
        print("指定されたディレクトリが見つかりませんでした。")
        return


target_dir = input("ディレクトリを指定してください: ")
effective_date = int(input("有効期限(日数)を指定してください: "))
result_log_file = "delete_log.txt"

old_file_automatically_regularly_deletion(target_dir, effective_date, result_log_file)
