import yaml


def config_validation(config_path):
    # コンフィグファイルを読み込む
    try:
        with open(config_path, "r") as file:
            config_data = yaml.safe_load(file)
    except FileNotFoundError:
        print("Config file not found.")
        exit(1)

    # バリデーションルール
    validation_rules = {"database_url": str, "api_key": str, "debug_mode": bool}

    # バリデーション結果を格納するリスト
    validation_results = []

    # コンフィグのバリデーション
    for key, expected_type in validation_rules.items():
        if key not in config_data:
            validation_results.append(f"{key}: Key is missing")
        elif not isinstance(config_data[key], expected_type):
            validation_results.append(
                f"{key}: Value must be a {expected_type.__name__}"
            )

    # バリデーション結果を表示
    if not validation_results:
        print("Config file is valid.")
    else:
        print("Validation result:")
        for result in validation_results:
            print("-", result)


config_path = input("コンフィグファイルのパスを入力: ")

config_validation(config_path)
