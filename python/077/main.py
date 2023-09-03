import argparse
import os
import shutil
from datetime import datetime, timedelta


def archive_logs(log_dir, archive_dir, days_to_archive):
    try:
        # 現在の日付から指定された日数前の日付を計算
        threshold_date = datetime.now() - timedelta(days=days_to_archive)

        # ログディレクトリ内のファイルをスキャン
        for root, _, files in os.walk(log_dir):
            for file in files:
                file_path = os.path.join(root, file)
                # ファイルの最終更新日を取得
                file_mtime = datetime.fromtimestamp(os.path.getmtime(file_path))
                # 最終更新日が指定した日数よりも古い場合、アーカイブ
                if file_mtime <= threshold_date:
                    archive_file(file_path, archive_dir)
        print("アーカイブが完了しました。")
    except Exception as e:
        print(f"エラー: {str(e)}")


def archive_file(file_path, archive_dir):
    try:
        # ファイルのベース名と拡張子を取得
        file_name, file_extension = os.path.splitext(os.path.basename(file_path))
        # ファイルの最終更新日を取得
        file_mtime = datetime.fromtimestamp(os.path.getmtime(file_path))
        # アーカイブファイル名にタイムスタンプを付ける
        timestamp = file_mtime.strftime("%Y%m%d%H%M%S")
        archive_file_name = f"{file_name}_{timestamp}{file_extension}"
        # アーカイブ先ディレクトリが存在しない場合は作成
        if not os.path.exists(archive_dir):
            os.makedirs(archive_dir)
        # アーカイブ先ディレクトリにファイルを移動
        shutil.move(file_path, os.path.join(archive_dir, archive_file_name))
        print(f"{file_path} をアーカイブしました。")
    except Exception as e:
        print(f"アーカイブエラー: {str(e)}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ログファイルの自動アーカイブ")
    parser.add_argument("log_dir", help="ログファイルが存在するディレクトリのパス")
    parser.add_argument("archive_dir", help="アーカイブ先ディレクトリのパス")
    parser.add_argument("days_to_archive", type=int, help="アーカイブ対象とする日数")
    args = parser.parse_args()

    archive_logs(args.log_dir, args.archive_dir, args.days_to_archive)
