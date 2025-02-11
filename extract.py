import pandas as pd
from sqlalchemy import create_engine
import plotly.express as px

# Load CSV file into a Pandas DataFrame
file_path = r"C:\Users\Lenovo\Desktop\ABD\ar_properties.csv"
df = pd.read_csv(file_path)

# Display basic information
print(df.head())
print(df.columns)

# Data Cleaning
df.fillna(0, inplace=True)  # Fill missing values with 0
df.drop_duplicates(inplace=True)  # Remove duplicate rows
df.columns = df.columns.str.strip()  # Strip any leading/trailing spaces
df['start_date'] = pd.to_datetime(df['start_date'], errors='coerce')  # Convert to datetime

# Visualization 1: Sales over time
fig1 = px.line(df, x='start_date', y='price', title='Sales Over Time')
fig1.show()

# Visualization 2: Customer segmentation by location
fig2 = px.bar(df, x='l1', y='price', title='Customer Segmentation by Location')
fig2.show()

# Database Connection to PostgreSQL
username = 'postgres'
password = '123'
host = 'localhost'
port = '5432'
database = 'mydb'

connection_string = f'postgresql://{username}:{password}@{host}:{port}/{database}'
engine = create_engine(connection_string)

# Load the DataFrame into the PostgreSQL database
df.to_sql('sales_data', engine, if_exists='replace', index=False)

# Confirm that the data was successfully loaded
print("Data successfully loaded into PostgreSQL!")

# Further visualizations and insights can be created using a BI tool connected to PostgreSQL.
