import datetime
import os
import subprocess


def backup_database(db_host, db_user, db_password, db_name, backup_dir):
    try:
        # バックアップファイルの名前を作成（日付を含む）
        today = datetime.date.today()
        backup_file_name = f"backup_{today}.sql"

        # バックアップコマンドを構築
        backup_command = f"mysqldump -h {db_host} -u {db_user} -p{db_password} {db_name} > {os.path.join(backup_dir, backup_file_name)}"

        # バックアップ実行
        subprocess.run(backup_command, shell=True, check=True)

        # バックアップ成功時のログ
        log_message = f"Backup successful: {backup_file_name}"

    except Exception as e:
        # エラー時のログ
        log_message = f"Backup failed: {str(e)}"

    # ログをファイルに書き込む
    log_file = "backup_log.txt"
    with open(log_file, "a") as log:
        log.write(f"{datetime.datetime.now()} - {log_message}\n")


# データベース接続情報
db_host = "your_db_host"
db_user = "your_db_user"
db_password = "your_db_password"
db_name = "your_db_name"

# バックアップ保存ディレクトリ
backup_dir = "/path/to/backup/directory/"

backup_database(db_host, db_user, db_password, db_name, backup_dir)
