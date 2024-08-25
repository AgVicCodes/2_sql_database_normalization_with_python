from sqlalchemy import create_engine
from data_generator import df
import json


with open("keys.json") as file:
    key = json.load(file)

engine = create_engine(f"postgresql+psycopg2://postgres:{key["password"]}@localhost:5432/transactions")

df.to_sql(name = "sales_records", con = engine, index = False, if_exists = "append")