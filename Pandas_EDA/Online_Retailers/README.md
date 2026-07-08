# 🛒 Online Retail Sales Analysis using Python & Pandas

## 📌 Project Overview

This project performs Exploratory Data Analysis (EDA) on a real-world online retail dataset containing customer transactions from a UK-based online retailer.

The objective is to clean the data, analyze customer purchasing behavior, identify sales trends, discover top-performing products, and generate business insights using Python and Pandas.

---

## 📂 Dataset

The dataset contains online retail transactions with the following information:

- Invoice Number
- Product Code
- Product Description
- Quantity Purchased
- Invoice Date & Time
- Product Price
- Customer ID
- Country

> **Note:** The original dataset is too large to include in this repository.

You can download it from Kaggle:
https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci

---

# 🛠️ Technologies Used

- Python
- Pandas
- Matplotlib
- Jupyter Notebook

---

# 📚 Python Concepts Used

- Data Loading
- Data Cleaning
- Data Exploration
- Feature Engineering
- GroupBy
- Aggregations
- Sorting
- Missing Value Handling
- DateTime Operations
- Data Visualization

---

# 📊 Data Cleaning

The following preprocessing steps were performed:

- Loaded the dataset
- Checked data types
- Checked missing values
- Removed duplicate records
- Converted InvoiceDate to DateTime format
- Identified cancelled/returned orders
- Created new analytical features

---

# ⚙️ Feature Engineering

Created additional columns such as:

- Revenue
- Year
- Month
- Day
- Hour

Revenue was calculated as:

Revenue = Quantity × Price

---

# 📈 Exploratory Data Analysis

The analysis includes:

## General Analysis

- Dataset overview
- Summary statistics
- Missing value analysis
- Duplicate detection

## Sales Analysis

- Total Revenue
- Monthly Revenue
- Daily Revenue
- Hourly Sales
- Average Order Value

## Product Analysis

- Top Selling Products
- Least Selling Products
- Highest Revenue Products
- Product Price Distribution

## Customer Analysis

- Number of Customers
- Top Customers by Revenue
- Average Customer Spending
- Customer Purchase Frequency

## Country Analysis

- Revenue by Country
- Orders by Country
- Customer Distribution by Country

---

# 📊 Visualizations

The project includes visualizations such as:

- Monthly Revenue Trend
- Revenue by Country
- Top Customers
- Sales Distribution
- Orders by Hour

---

# 📌 Business Questions Answered

- Which country generated the highest revenue?
- Which products sold the most?
- Which products generated the highest revenue?
- Who are the top customers?
- Which month generated the highest sales?
- During which hour are the most orders placed?
- What is the average order value?
- Which countries have the highest number of customers?

---

# 💡 Key Insights

- Identified the best-performing products.
- Found the highest revenue-generating countries.
- Analyzed customer purchasing behavior.
- Identified peak shopping periods.
- Calculated important retail KPIs.

---

# 📦 Requirements

- pandas
- matplotlib
- jupyter

---

# 📖 Learning Outcomes

Through this project I practiced:

- Real-world data cleaning
- Exploratory Data Analysis (EDA)
- Feature Engineering
- Pandas Data Manipulation
- Business Data Analysis
- Data Visualization
- Extracting actionable business insights

