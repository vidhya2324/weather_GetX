# 🌤️ Weather Forecast App

A simple and interactive **Flutter weather application** built using **GetX state management**.  
This app allows users to select any **Indian city** from a dropdown list and view **real-time weather data** including temperature (°C/°F), climate condition, and sunrise/sunset timings — all powered by the **OpenWeatherMap API**.

---
# Deployed App
# https://weather-get-x.vercel.app/#/home

## 🚀 Features

- 🌎 Fetches live weather data from **OpenWeatherMap**
- 🏙️ Dynamic district list fetched from API (`countriesnow.space`)
- 🌡️ Displays both **Celsius and Fahrenheit**
- ☀️ Shows **weather condition**, **sunrise**, and **sunset** times
- 🧭 Clean UI with GetX reactive updates
- 📱 Works on both Android & iOS

---

## 🧰 Tech Stack

| Component | Description |
|------------|--------------|
| **Framework** | Flutter |
| **State Management** | GetX |
| **API Integration** | HTTP package |
| **UI Widgets** | DropdownSearch, RichText, Obx |
| **Weather API** | [OpenWeatherMap](https://openweathermap.org/api) |

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/<your-username>/weather_app.git
cd weather_app
