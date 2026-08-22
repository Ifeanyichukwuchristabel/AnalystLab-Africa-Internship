# 🌦️ Real-Time Weather ETL Pipeline

## 📌 Project Overview

This project demonstrates the development of a basic ETL (Extract, Transform, Load) pipeline using real-time weather data from the OpenWeather API.

The pipeline extracts weather information for selected Nigerian cities, transforms the raw API response into a clean and structured dataset using Pandas, stores the processed data as a CSV file, and performs basic analysis to generate insights.

This project was completed as part of my Week 7 Data Analytics Internship at AnalystLab Africa.

---

## 🎯 Project Objective

The main objective of this project was to build a simple automated ETL pipeline that demonstrates how data can be:

- Extracted from an external API
- Cleaned and transformed using Python and Pandas
- Stored in a structured format
- Analyzed to generate meaningful insights

---

## 📡 Data Source

**OpenWeather API**

The project uses the OpenWeather Current Weather API to retrieve real-time weather information.

### Cities analyzed

- Lagos
- Abuja
- Port Harcourt
- Kano
- Enugu

### Data collected

- City
- Temperature
- Humidity
- Weather condition
- Wind speed
- Date and time

---

## 🔄 ETL Process

### 1. Extract

The weather data was extracted from the OpenWeather API using Python's `requests` library.

The API response was returned in JSON format and relevant fields were selected from the response.

### 2. Transform

The extracted data was transformed using Pandas.

Transformation steps included:

- Converting the API response into a DataFrame
- Standardizing column names
- Converting numerical fields to appropriate data types
- Converting Unix timestamps into readable date/time values
- Creating separate date and time fields
- Checking for missing values
- Checking for duplicate records
- Validating the extracted locations and weather values

### 3. Load

The transformed dataset was saved as a CSV file for future analysis.

Output:

`data/cleaned_weather_data.csv`

The raw extracted data was also preserved separately.

---

## 🛠️ Tools & Technologies

- Python
- Pandas
- Requests
- Matplotlib
- python-dotenv
- Jupyter Notebook
- OpenWeather API
- Git & GitHub

---

## 📊 Analysis

Basic analysis was performed to compare weather conditions across the selected cities.

The analysis examined:

- Temperature differences
- Humidity levels
- Wind speed
- Weather conditions
- Average temperature
- Average humidity

---

## 🔎 Key Findings

Based on the weather data collected at the time of extraction:

- **Kano recorded the highest temperature at 31.74°C.**
- **Enugu recorded the lowest temperature at 26.87°C.**
- The average temperature across the five cities was **28.32°C**.
- **Enugu recorded the highest humidity at 82%.**
- The average humidity across the five cities was **70.60%**.
- **Kano recorded the highest wind speed at 4.03 m/s.**
- **Port Harcourt reported light rain**, while the other cities reported different cloud conditions.

> Note: These findings represent weather conditions captured at the time of data extraction and should not be interpreted as long-term climate patterns.

---

## 🧹 Data Quality Validation

During the extraction process, an initial location query produced an unexpected weather reading for "Rivers."

The result was reviewed and identified as an ambiguous location query rather than the intended Rivers State location.

To improve location accuracy, the query was changed to:

`Port Harcourt,NG`

This ensured that the analysis used the intended Nigerian city rather than relying on an ambiguous location name.

This highlighted the importance of validating API responses before using them for analysis.

---

## 📁 Project Structure

```text
Week_7_Weather_ETL/
│
├── data/
│   ├── raw_weather_data.csv
│   └── cleaned_weather_data.csv
│
├── weather_etl_pipeline.ipynb
├── weather_etl.py
├── requirements.txt
├── .gitignore
└── README.md