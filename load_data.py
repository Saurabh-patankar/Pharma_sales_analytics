import pandas as pd
import sqlite3

df = pd.read_csv("data/pharma_sales_data.csv")
conn = sqlite3.connect("pharma_sales.db")
df.to_sql(
    "pharma_sales",
    conn,
    if_exists="replace",
    index=False
)

print("Data loaded into SQLite database!")