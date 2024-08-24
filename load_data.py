from sqlalchemy import create_engine
from data_generator import df
import glob
import json


with open("keys.json") as file:
    key = json.load(file)

engine = create_engine(f"postgresql+psycopg2://postgres:{key["password"]}@localhost:5432/transactions")

csv_files = glob.glob(f"data/csv/*.{'csv'}")

count = len(csv_files)

df.to_csv(f"data/csv/transactions{count}.csv", index = False)

df.to_sql(name = "sales_records", con = engine, index = False, if_exists = "append")