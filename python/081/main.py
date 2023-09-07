import subprocess
import time

import psutil


def log_restart(process_name):
    # プロセスの再起動を実行し、ログに記録
    try:
        subprocess.run(["systemctl", "restart", process_name], check=True)
        with open("restart_log.txt", "a") as log_file:
            timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
            log_entry = f"Timestamp: {timestamp}, Restarted process: {process_name}\n"
            log_file.write(log_entry)
    except subprocess.CalledProcessError:
        print(f"Failed to restart process: {process_name}")


def monitor_process(target_process_name, threshold, monitoring_interval):
    while True:
        # psutilを使用して監視対象のプロセスを取得
        for process in psutil.process_iter(attrs=["pid", "name", "cpu_percent"]):
            if process.info["name"] == target_process_name:
                cpu_percent = process.info["cpu_percent"]
                if cpu_percent >= threshold:
                    # CPU使用率が閾値以上の場合、プロセスを再起動
                    log_restart(target_process_name)

        time.sleep(monitoring_interval)


target_process_name = input("監視対象のプロセス名: ")
threshold = int(input("閾値: "))
monitoring_interval = int(input("監視間隔（秒）: "))

monitor_process(target_process_name, threshold, monitoring_interval)
