# Africa: Digital Development & Economic Performance

## 📊 Project Overview

This is my **Week 8 Data Analytics Capstone Project**, built with the World Bank's **World Development Indicators (WDI)** and Power BI.

The project explores the relationship between **digital access and economic development**, focusing on mobile subscriptions, internet usage, foreign direct investment (FDI), GDP growth, and GDP per capita.

## 🎯 Objectives

- Analyze digital access across countries.
- Compare FDI and economic performance.
- Examine GDP per capita trends.
- Compare **Middle East & North Africa (MENA)** with **Sub-Saharan Africa**.
- Identify patterns between digital connectivity and economic development.

## 🗂️ Data Source

**World Bank — World Development Indicators (WDI)**

### Key Indicators

- Mobile subscriptions
- Internet usage
- Foreign direct investment (FDI)
- GDP growth
- GDP per capita
- Country
- Region
- Year

## 🛠️ Tools & Technologies

- **Power BI** — Dashboard development and visualization
- **Power Query** — Data cleaning and transformation
- **DAX** — Measures and calculations
- **World Bank WDI** — Data source

## 🔄 Data Preparation

The dataset was prepared through the following steps:

1. Downloaded and extracted the World Development Indicators dataset.
2. Transformed the dataset into an analysis-friendly structure.
3. Created a `WDICountry` dimension containing country information and regions.
4. Created a relationship between the country dimension and the main WDI table using `Country Code`.
5. Created a custom `Continent` column from the World Bank `Region` column.
6. Classified both **Sub-Saharan Africa** and **Middle East & North Africa** as **Africa**, while keeping the original `Region` column for regional comparisons.

## 📈 Dashboard Highlights

The dashboard provides the following headline metrics:

- **Countries Analyzed:** 71
- **Average Mobile Subscriptions:** 6.70M
- **Average FDI:** 3.61
- **Average GDP Growth:** 4.13
- **Average Internet Usage:** 19.19
- **Average GDP per Capita:** 3.68K

### Visualizations

- Yearly Average GDP per Capita
- Average FDI by Country
- Average GDP per Capita by Region
- Internet Usage by Country
- Average GDP Growth by Region
- Average Mobile Subscriptions by Country

## 🔎 Key Findings

### 1. Digital access varies considerably

Mobile subscriptions and internet usage differ substantially across countries, highlighting differences in digital development.

### 2. FDI is unevenly distributed

The country-level FDI visualization shows noticeable differences between countries, suggesting that investment activity is concentrated in particular markets.

### 3. Regional differences matter

The comparison between **Middle East & North Africa** and **Sub-Saharan Africa** provides useful insight into differences in economic and digital development.

### 4. Digital and economic indicators should be analyzed together

Combining digital connectivity indicators with FDI, GDP growth and GDP per capita makes it easier to identify patterns, differences and potential relationships.

> **Important:** These findings are descriptive. The dashboard does not establish that digital access directly causes higher FDI or economic growth.

## 💡 Business Value

This project demonstrates how development data can be transformed into insights that can support:

- Policy analysis
- Investment research
- Digital development planning
- Economic research
- Business intelligence
- Data-driven decision-making

## ⚠️ Data Considerations

Interpretation should consider:

- FDI can be influenced by many factors beyond digital access.
- Mobile subscriptions do not necessarily represent unique users.
- GDP growth and GDP per capita measure different aspects of economic performance.
- World Bank regional classifications should not be confused with geographic continents.

## 🚀 Future Improvements

Possible extensions include:

- Adding population and GDP size as contextual variables.
- Including electricity access and fixed broadband.
- Adding correlation analysis.
- Adding year-over-year measures.
- Creating detailed indicator definitions and tooltips.
- Creating country-level drill-through analysis.

## 👩🏽‍💻 Author

**Ifeanyichukwu Christabel**

Data Analyst | Banking & Finance Graduate

**AnalystLab Africa Data Analytics Internship — Week 8 Capstone**
