## Overview

This ETL pipeline extracts sales data from a CSV file, performs data cleaning, visualizes the cleaned data using Plotly, and loads the data into a PostgreSQL database. It is designed to provide valuable insights into sales trends and customer segmentation, and the cleaned data is loaded into PostgreSQL for further analysis and visualization.

## Project Structure

The project consists of the following key steps:

**Data Extraction**: Load data from a CSV file.
**Data Transformation**: Perform cleaning and preprocessing on the data.
**Data Visualization**: Visualize data using Plotly charts.
**Data Loading**: Store the cleaned data into a PostgreSQL database.

## Prerequisites

To run the ETL pipeline, ensure the following libraries are installed:

- pandas
- sqlalchemy
- plotly
- psycopg2 (for PostgreSQL support)

You can install the required libraries using pip:

bash
pip install pandas sqlalchemy plotly psycopg2

## 1. Data Schema Design

The data schema for the `sales_data` table is as follows:

| Column Name  | Description                              | Data Type  |
| ------------ | ---------------------------------------- | ---------- |
| `start_date` | Date when the sale occurred              | `datetime` |
| `price`      | Total value of the sale (sales amount)   | `float`    |
| `l1`         | Customer's location (e.g., city, region) | `string`   |
| `product_id` | Unique identifier for each product       | `integer`  |
| `quantity`   | Quantity of the product sold             | `integer`  |

The database schema was designed to store sales data, including product details, customer location, and sales value.

---

## 2. Data Cleaning Process

The data cleaning process includes the following steps:

1. **Filling Missing Values**: Any missing values in the `price` column are replaced with `0` to represent missing sales values. This approach assumes that missing sales data is equivalent to a zero transaction.
2. **Removing Duplicates**: Duplicate rows were removed from the dataset to ensure accurate analysis.

3. **Stripping Column Name Spaces**: Leading and trailing spaces in column names were stripped to avoid issues when referencing columns programmatically.

4. **Date Conversion**: The `start_date` column was converted to `datetime` format to enable time-based analysis. Invalid date values were coerced into `NaT`.

---

## 3. Assumptions

- **Sales Value**: The `price` column represents the total value of a sale. It is assumed that this field already accounts for any discounts, promotions, or taxes.
- **Customer Location (`l1`)**: The `l1` field represents the geographic location of the customer (e.g., city or region). It is assumed that location data is up-to-date and accurate.

- **Date Formatting**: Any invalid or missing date values in `start_date` were converted to `NaT` during the cleaning process. These rows were discarded for analysis.

---

## 4. Findings and Insights

### 4.1 Sales Over Time

- There was a significant increase in sales during the **holiday season** (November-December), which is a common trend in e-commerce.
- **Sales decline** during summer months, which may be attributed to seasonal factors such as fewer purchases or promotions.

### 4.2 Customer Segmentation by Location

- **Urban areas** (e.g., New York, Los Angeles) represent the highest sales, indicating that the company’s products are more popular in metropolitan regions.
- **Rural areas** have lower sales, suggesting potential opportunities for market expansion or targeted marketing strategies.

---

## 5. Conclusion

The ETL pipeline successfully processed and transformed the raw data into a format suitable for analysis. The visualizations and insights provide valuable business intelligence, such as identifying sales seasonality and understanding customer segmentation.

---

### **How to Use This Pipeline**

1. Clone this repository or download the script.
2. Update the file path for the CSV in the script (`etl_pipeline.py`).
3. Ensure PostgreSQL is installed and running. Update database credentials (`username`, `password`, `host`, `port`, `database`) accordingly.
4. Run the Python script to execute the ETL pipeline and load d
