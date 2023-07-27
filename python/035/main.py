import psutil


def check_high_cpu_processes(threshold):
    # 現在実行中のすべてのプロセスの情報を取得
    all_processes = psutil.process_iter(["pid", "name", "cpu_percent"])

    # 各プロセスのCPU使用率を取得
    for process in all_processes:
        pid = process.info["pid"]
        name = process.info["name"]
        cpu_percent = process.info["cpu_percent"]

        # CPU使用率が一定の閾値を超えるプロセスを表示
        if cpu_percent > threshold:
            print(f"PID: {pid} | プロセス名: {name} | CPU使用率: {cpu_percent}%")


threshold = 0.1
check_high_cpu_processes(threshold)
