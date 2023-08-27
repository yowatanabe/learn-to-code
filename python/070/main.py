import os
import re
from collections import Counter


def extract_and_count_ips(log_file_path):
    try:
        ip_pattern = r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"
        ip_counter = Counter()

        for root, _, files in os.walk(log_file_path):
            for file in files:
                file_path = os.path.join(root, file)

                with open(file_path, "r") as log_file:
                    for line in log_file:
                        match = re.search(ip_pattern, line)
                        if match:
                            ip = match.group()
                            ip_counter[ip] += 1

        return ip_counter

    except Exception as e:
        print(f"エラーが発生しました: {e}")
        return None


def save_aggregated_result(ip_counter, output_file_path):
    try:
        with open(output_file_path, "w") as output_file:
            for ip, count in ip_counter.items():
                output_file.write(f"{ip}: {count}\n")
            print(f"集計結果を '{output_file_path}' ファイルに保存しました。")

    except Exception as e:
        print(f"エラーが発生しました: {e}")


log_file_path = input("ログファイルのパス: ")
output_file_path = input("集計結果を保存するファイルのパス: ")

ip_counter = extract_and_count_ips(log_file_path)
if ip_counter:
    save_aggregated_result(ip_counter, output_file_path)
