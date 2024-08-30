import glob
import pandas as pd
import os
import json
from sqlalchemy import create_engine

# Declare path to the csv files
file_path = "data/csv"

# Select a list of all the files in the file path
files = glob.glob(f"{file_path}/*.csv")

# Initiates a dataframe
df = pd.DataFrame()

# loop through the list to convert each 
# csv to dataframe and remove them 
for csv_file in files:
    temp_df = pd.read_csv(csv_file)
    df = df._append(temp_df, ignore_index = True)
    # os.remove(csv_file)

# Stores the compiled csv file
df.to_csv("data/csv/sales_data.csv")

# get keys from json file
with open("keys.json") as file:
    keys = json.load(file)

# Creates engine
engine = create_engine(f"{keys["provider"]}+{keys["dialect"]}://{keys["username"]}:{keys["password"]}@{keys["host"]}:{keys["port"]}/{keys["database"]}")

# Saves to local sql database
df.to_sql(con = engine, name = "sales_records", index = False, if_exists = "append")