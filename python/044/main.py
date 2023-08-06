import os
import subprocess
import time
from datetime import datetime

result_log = "script_log.txt"


def execute_python_scripts(scripts_dir):
    # ディレクトリが存在するか確認
    if not os.path.isdir(scripts_dir):
        print("ディレクトリが存在しませんでした")
        return

    # 実行結果ログ
    with open(result_log, "a") as rl:
        rl.write("Pythonスクリプトの実行結果:\n")

    # Pythonスクリプト実行処理
    for root, _, scripts in os.walk(scripts_dir):
        for script in scripts:
            if script.endswith(".py"):
                script_path = os.path.join(root, script)

                # Pythonスクリプトを実行。標準出力と標準エラー出力を取得。
                result = subprocess.run(
                    ["python", script_path], capture_output=True, text=True
                )
                # 実行結果をログファイルに記録
                with open(result_log, "a") as rl:
                    rl.write(f"\n---実行ファイル:{script_path}---\n")
                    rl.write(f"---実行時間:{datetime.now()}---\n")
                    rl.write(f"標準出力:\n{result.stdout}\n")
                    rl.write(f"標準エラー出力:\n{result.stderr}\n")

    print("Pythonスクリプトの実行が完了しました。")


scripts_dir = input("Pythonスクリプトファイルのディレクトリを指定: ")

while True:
    execute_python_scripts(scripts_dir)
    time.sleep(5)
