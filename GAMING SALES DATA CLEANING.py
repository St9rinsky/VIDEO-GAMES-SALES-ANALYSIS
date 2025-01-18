import pandas as pd

# Loading the dataset
file_path = r"C:\Users\XUser\Documents\PROJECTS\GAMING SALES\gamingsales2024.csv\gamingsales2024.csv"
data = pd.read_csv(file_path)

# filled in missing critic scores with the average score
data['critic_score'] = data['critic_score'].fillna(data['critic_score'].mean())

# Filled in missing values in total_sales and regional sales with 0
sales_columns = ['total_sales', 'na_sales', 'jp_sales', 'pal_sales', 'other_sales']
data[sales_columns] = data[sales_columns].fillna(0)

# Dropped rows where essential columns are missing
data = data.dropna(subset=['title', 'console'])

# Converted release_date to datetime and handled invalid entries
data['release_date'] = pd.to_datetime(data['release_date'], errors='coerce')
data = data.dropna(subset=['release_date'])  # this drops rows with invalid dates

# Dropped rows that have unnecessary columns
data = data.drop(columns=['img', 'last_update'])

# Standardized text columns
text_columns = ['title', 'console', 'genre', 'publisher', 'developer']
for col in text_columns:
    data[col] = data[col].str.strip().str.title()  # this removes extra spaces and title-case


cleaned_file_path = r"C:\Users\XUser\Documents\PROJECTS\GAMING SALES\cleaned_gamingsales.csv"
data.to_csv(cleaned_file_path, index=False)

print(f"Cleaned dataset saved to: {cleaned_file_path}")
