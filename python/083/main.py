import re


def calculate_error_rate(target_parameter, log_entries):
    total_requests = len(log_entries)
    error_requests = 0

    for entry in log_entries:
        if entry["status_code"] >= 400 and target_parameter in entry["request_params"]:
            error_requests += 1

    error_rate = error_requests / total_requests

    return error_rate


def main(log_file_path, target_parameter, error_threshold):
    with open(log_file_path, "r") as log_file:
        log_data = log_file.read()

    # ログエントリーの抽出（例: "GET /path?example_param=value1 HTTP/1.1 404"）
    log_entries = re.findall(r"(\S+)\s+(\S+)\s+(\S+)\s+(\d+)", log_data)

    # ログエントリーの構造化
    log_entries = [
        {"request_params": entry[1], "status_code": int(entry[3])}
        for entry in log_entries
    ]

    error_rate = calculate_error_rate(target_parameter, log_entries)

    if error_rate > error_threshold:
        # エラーレートが閾値を超えた場合、通知を生成
        print(f"High error rate detected ({error_rate:.2%}) - Generating notification")


log_file_path = input("監視対象のログファイル: ")
target_parameter = input("監視するリクエストパラメーター: ")
error_threshold = float(input("エラーレスポンスの閾値（例. 0.1）: "))

main(log_file_path, target_parameter, error_threshold)
main(log_file_path, target_parameter, error_threshold)
