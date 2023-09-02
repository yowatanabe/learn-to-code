def monitor_log_file(log_file_path, error_threshold, keyword):
    try:
        # ログファイルを開いて行数とエラー行数をカウント
        with open(log_file_path, "r") as log_file:
            total_lines = 0
            error_lines = 0
            for line in log_file:
                total_lines += 1
                if keyword in line:
                    error_lines += 1

        # エラー率を計算
        error_rate = (error_lines / total_lines) * 100

        print(f"Total lines: {total_lines}")
        print(f"{keyword} lines: {error_lines}")
        print(f"{keyword} rate: {error_rate:.2f}%")

        # エラー率がしきい値を超えた場合にアラート
        if error_rate > error_threshold:
            print("ALERT: Error rate exceeds threshold!")
        else:
            print("No issues detected.")

    except FileNotFoundError:
        print("Error: Log file not found.")
    except ZeroDivisionError:
        print("Error: Log file is empty.")
    except Exception as e:
        print(f"An error occurred: {e}")


log_file_path = input("監視対象のログファイルのパス: ")
error_threshold = float(input("エラー率のしきい値 (例:5.0): "))
keyword = input("監視対象のパターン (例:ERROR): ")

monitor_log_file(log_file_path, error_threshold, keyword)
