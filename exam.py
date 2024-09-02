import pandas as pd

dict1 = {
    "age": [25, 30, 40]
}

df = pd.DataFrame(dict1)

df["valid_age"] = df["age"].apply(lambda x: "Valid" if x in range(25, 41) else "Invalid")

print(df)

pd.to_datetime(df['date'], format='%m%d%Y %H:%M:%S')