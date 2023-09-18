import random
import time


# ランダムなリソース使用率を生成する関数
def generate_resource_usage():
    return random.randint(0, 100)


# リソースの監視とアラート生成
def monitor_resources(thresholds, interval):
    while True:
        cpu_usage = generate_resource_usage()
        memory_usage = generate_resource_usage()
        disk_usage = generate_resource_usage()

        if cpu_usage > thresholds["cpu"]:
            generate_alert(
                f'CPU使用率が{thresholds["cpu"]}%を超えました！現在のCPU使用率は{cpu_usage}%です！'
            )

        if memory_usage > thresholds["memory"]:
            generate_alert(
                f'メモリ使用率が{thresholds["memory"]}%を超えました！現在のメモリ使用率は{memory_usage}%です！'
            )

        if disk_usage > thresholds["disk"]:
            generate_alert(
                f'ディスク使用率が{thresholds["disk"]}%を超えました！現在のディスク使用率は{disk_usage}%です！'
            )

        time.sleep(interval)


# アラートメッセージを生成して出力
def generate_alert(message):
    timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")


if __name__ == "__main__":
    # しきい値の設定（例：CPUが90％以上、メモリが80％以上、ディスクが95％以上）
    thresholds = {"cpu": 90, "memory": 80, "disk": 95}

    # リソース監視の間隔(秒)
    interval = int(input("リソース監視の間隔(秒): "))

    # リソースの監視とアラート生成を開始
    monitor_resources(thresholds, interval)
