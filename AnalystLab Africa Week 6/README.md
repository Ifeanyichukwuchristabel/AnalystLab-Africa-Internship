# 📈 Week 6 — AAPL Stock Market Analysis

## Project Overview

For Week 6 of my **AnalystLab Africa Data Analytics Internship**, I explored historical stock-market data for **Apple Inc. (AAPL)** using Python.

The goal was to move beyond basic data manipulation and use Python to uncover trends, returns, and volatility within historical stock prices.

## 🎯 Objectives

* Clean and prepare historical stock-market data
* Analyze AAPL's closing-price trend
* Calculate daily price changes and returns
* Calculate moving averages
* Measure rolling volatility
* Identify the best and worst trading days
* Analyze annual performance
* Communicate findings through visualizations

## 🛠️ Tools & Libraries

* Python
* Pandas
* Matplotlib
* Jupyter Notebook

## 🔎 Analysis Performed

### Data Preparation

The dataset contained daily AAPL market information including:

* Open
* High
* Low
* Close
* Volume

The dataset was cleaned by flattening the MultiIndex columns, selecting the required market variables, converting the Date column to a datetime index, and sorting observations chronologically.

### Feature Engineering

The following features were created:

* **Daily Change** — difference between the current and previous closing price
* **Daily Return (%)** — percentage change in closing price
* **20-Day Moving Average**
* **50-Day Moving Average**
* **20-Day Rolling Volatility**
* **Monthly Returns**
* **Annual Returns**

## 📊 Key Findings

* AAPL showed a strong overall upward trend across the approximately five-year period.
* The closing price increased from around **$147 in August 2021 to above $300 in 2026**.
* AAPL recorded approximately **48.18% annual growth in 2023**.
* Annual growth was approximately **30.07% in 2024**.
* Growth slowed to approximately **8.56% in 2025**.
* The best trading day was **April 9, 2025**, with a return of approximately **15.33%**.
* The worst trading day was **April 3, 2025**, with a return of approximately **-9.25%**.
* Rolling volatility showed a significant spike during 2025, highlighting a period of increased market uncertainty.

## 📈 Visualizations

The project includes four main visualizations:

1. **AAPL Closing Price Trend**
2. **AAPL Closing Price with 20-Day and 50-Day Moving Averages**
3. **AAPL Daily Percentage Returns**
4. **AAPL 20-Day Rolling Volatility**

## 💡 Key Insight

The analysis reinforced an important lesson in financial data analysis:

> Strong long-term growth does not mean consistent short-term performance.

AAPL experienced substantial overall appreciation while still recording sharp daily gains, losses, and periods of elevated volatility.

## 📁 Project Structure

```text
Week 6/
│
├── Analysis.ipynb
├── AAPL Historical Data.csv
└── README.md
```

## 🚀 Conclusion

This project strengthened my ability to use Python for financial time-series analysis and demonstrated how data can be transformed into meaningful insights about **performance, momentum, and risk**.
