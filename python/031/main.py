import os

import pandas as pd

current_dir = os.path.dirname(os.path.abspath(__file__))
file_name = "data.csv"
file_path = os.path.join(current_dir, file_name)
filter_column = "Occupation"
filter_value = "Developer"


def filter_csv(file_path, filter_column, filter_value):
    df = pd.read_csv(file_path)
    filtered_df = df[df[filter_column] == filter_value]
    print(filtered_df)


filter_csv(file_path, filter_column, filter_value)
