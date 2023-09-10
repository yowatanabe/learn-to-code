import datetime


def check_error_messages(log_file_path, start_date_str, end_date_str):
    # 開始日と終了日を日付オブジェクトに変換
    start_date = datetime.datetime.strptime(start_date_str, "%Y-%m-%d")
    end_date = datetime.datetime.strptime(end_date_str, "%Y-%m-%d")

    # エラーメッセージの初期化
    error_messages = []

    # ログファイルを開いて読み取り
    with open(log_file_path, "r") as log_file:
        for line in log_file:
            parts = line.split()
            if len(parts) >= 4 and parts[2] == "-":
                log_date_str = parts[0] + " " + parts[1]
                log_date = datetime.datetime.strptime(log_date_str, "%Y-%m-%d %H:%M:%S")
                # ログの日付が指定した期間内にあるか確認し、ログレベルが "ERROR" であるかをチェック
                if start_date <= log_date <= end_date and parts[3] == "ERROR:":
                    error_messages.append(" ".join(parts[4:]))

    if error_messages:
        print(
            f"{start_date_str} から {end_date_str} までのエラーメッセージ数: {len(error_messages)} 件"
        )
        print("エラーメッセージ:")
        for message in error_messages:
            print(message)
    else:
        print(f"{start_date_str} から {end_date_str} までのエラーメッセージは見つかりませんでした。")


log_file_path = input("ログファイルのパスを入力してください: ")
start_date_str = input("開始日（YYYY-MM-DD）を入力してください: ")
end_date_str = input("終了日（YYYY-MM-DD）を入力してください: ")

check_error_messages(log_file_path, start_date_str, end_date_str)
