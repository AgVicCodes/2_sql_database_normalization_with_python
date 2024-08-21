from sqlalchemy import URL, create_engine
import psycopg2
import sys
from data_generator import df


conn = create_engine("postgresql+psycopg2://postgres:abo200313@localhost:5432/transactions")

df.to_sql(con = conn, engine = "sqlalchemy", index = False)





# insert_query = "INSERT INTO sales () VALUES ()"
# schema = ""

# conn_string = "host='localhost' dbname='postgres' user='postgres' password='abo200313'"

# print(f"Connecting to DB {(conn_string)}")

# conn = psycopg2.connect(conn_string)

# cursor = conn.cursor()

# cursor.execute("SELECT * FROM sales_records;")

# record = cursor.fetchall()

# print(record)