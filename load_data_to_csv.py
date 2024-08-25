from data_generator import df
import glob


csv_files = glob.glob(f"data/csv/*.{'csv'}")

count = len(csv_files)

df.to_csv(f"data/csv/transactions{count}.csv", index = False)