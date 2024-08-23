from sqlalchemy import text, create_engine
import psycopg2
import sys
from data_generator import df


engine = create_engine("postgresql+psycopg2://postgres:abo200313@localhost:5432/transactions")

df.to_sql(name = "sales_records", con = engine, index = False, if_exists = "append")

# print(df.head(3))

# with engine.connect() as conn:
#    conn.execute(text("SELECT * FROM sales_records")).fetchall()




# insert_query = "INSERT INTO sales () VALUES ()"
# schema = ""

# conn_string = "host='localhost' dbname='postgres' user='postgres' password='abo200313'"

# print(f"Connecting to DB {(conn_string)}")

# conn = psycopg2.connect(conn_string)

# cursor = conn.cursor()

# cursor.execute("SELECT * FROM sales_records;")

# record = cursor.fetchall()

# print(record)