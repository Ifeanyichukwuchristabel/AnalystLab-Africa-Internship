import os
import requests
import pandas as pd
from dotenv import load_dotenv


# Load environment variables
load_dotenv()

API_KEY = os.getenv("OPENWEATHER_API_KEY")

if not API_KEY:
    raise ValueError("OPENWEATHER_API_KEY not found. Check your .env file.")


# Cities to collect weather data for
cities = [
    "Lagos,NG",
    "Abuja,NG",
    "Port Harcourt,NG",
    "Kano,NG",
    "Enugu,NG"
]

URL = "https://api.openweathermap.org/data/2.5/weather"

weather_data = []


# EXTRACT
for city in cities:

    params = {
        "q": city,
        "appid": API_KEY,
        "units": "metric"
    }

    response = requests.get(URL, params=params)

    if response.status_code == 200:

        data = response.json()

        weather_data.append({
            "city": data["name"],
            "temperature": data["main"]["temp"],
            "humidity": data["main"]["humidity"],
            "weather_condition": data["weather"][0]["description"],
            "wind_speed": data["wind"]["speed"],
            "date_time": pd.to_datetime(data["dt"], unit="s")
        })

    else:
        print(f"Failed to retrieve data for {city}")


# Convert extracted data to DataFrame
weather_df = pd.DataFrame(weather_data)


# TRANSFORM
weather_df.columns = (
    weather_df.columns
    .str.lower()
    .str.strip()
    .str.replace(" ", "_")
)

weather_df["temperature"] = pd.to_numeric(weather_df["temperature"])
weather_df["humidity"] = pd.to_numeric(weather_df["humidity"])
weather_df["wind_speed"] = pd.to_numeric(weather_df["wind_speed"])
weather_df["date_time"] = pd.to_datetime(weather_df["date_time"])

weather_df["date"] = weather_df["date_time"].dt.date
weather_df["time"] = weather_df["date_time"].dt.time


# LOAD
os.makedirs("data", exist_ok=True)

weather_df.to_csv(
    "data/cleaned_weather_data.csv",
    index=False
)

print("ETL pipeline completed successfully!")
print("Cleaned dataset saved to data/cleaned_weather_data.csv")