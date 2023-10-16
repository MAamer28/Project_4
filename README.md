# TTC Bus Delays: Past, Present, and Future
### Project 4: by Mohamed Aamer, Urja Dudhwala, Peerapat Phatpanichot

## Abstract
In this research project, data on TTC bus delays was taken from the Open Data Toronto portal and analyzed to develop a machine learning model capable of predicting the minute delays of buses on a particular day. 

The project hopes to offer tools to assist the TTC in anticipating days with prolonged delays and therefore let operators mobilize extra resources accordingly.

## Tasks
- Dataset ETL
- Creating a SQL database
- Creating Tableau visuals
- Random Forest machine learning code
- SARIMAX() Time Series machine learning code
- Organizing presentation and Readme

## Introduction/Dataset

The 2022 TTC Bus Delay dataset was inputted into Tableau to detect pre-existing trends. A Tableau public story is linked here (https://public.tableau.com/shared/SXZX9QZWQ?:display_count=n&:origin=viz_share_link) for an interactive storyboard of visuals. 

_Figure 1: Number of Delay Incidents in 2022 by Type_
![Year in Review by Incident Type - 2022](https://github.com/MAamer28/Project_4/assets/130619866/c0484a34-dcaa-4f3e-96cc-12de04e49388)

_Figure 2: Counts of Delays by Day of Week_
![Delay Incidents by Weekday](https://github.com/MAamer28/Project_4/assets/130619866/966445ea-8601-40fe-b374-c8d41514f53a)

_Figure 3: Dashboard Showing Incident Types_
![Types of Incidents](https://github.com/MAamer28/Project_4/assets/130619866/fcaf5c28-8e1f-45a3-9413-73ae05deb6ec)

_Figure 4: Minute Delays by Incident Type (Avg)_
![Avg Min Delay by Incident Type](https://github.com/MAamer28/Project_4/assets/130619866/6b6b9f65-e47b-4a4d-b67d-d96df6408e18)

_Figure 5: Top Ten TTC Bus Routes by Average Minute Delays in 2022_
![Routes with Longest Delays (Min)](https://github.com/MAamer28/Project_4/assets/130619866/12d09ac6-a10d-4d3c-961c-2c14dc432965)

# Toronto Bus Delay Forecast Using (SARIMAX())

## Overview
Forecast the overall minutes of delay (`Min Delay`) for Toronto buses from the upcoming month until the end of 2023, and the beginning of 2024. This prediction utilizes Time Series Analysis and the SARIMAX model, considering the types of incidents (`Incident` column) as exogenous factors to enhance prediction accuracy.

## Table of Contents (Time Series Analysis)

- [Time Series Analysis](#time-series-analysis)
  - [Initial Approach with ARIMA](#initial-approach-with-arima)
  - [SARIMA Model](#sarima-model)
- [Transition to SARIMAX](#transition-to-sarimax)
  - [Exogenous Variables Visualization](#exogenous-variables-visualization)
- [Stationarity Testing](#stationarity-testing)
- [Model Selection](#model-selection)
- [Model Evaluation](#model-evaluation)
  - [SARIMAX Model Components](#sarimax-model-components)
- [Prediction](#prediction)
- [Conclusion](#conclusion)

## Time Series Analysis

Time series analysis is a statistical technique that deals with time series data or data points arranged in chronological order. It helps uncover patterns, trends, and makes future predictions.

### Initial Approach with ARIMA

ARIMA stands for AutoRegressive Integrated Moving Average:
- **AR (AutoRegressive):** Uses past values to predict future values.
- **I (Integrated):** Represents the differencing of raw observations to allow for stationarity.
- **MA (Moving Average):** Uses past forecast errors to predict the future.

### SARIMA Model

Given unsatisfactory predictions from the ARIMA model and noticing a weekly seasonality pattern in the `Min Delay` data, the SARIMA (Seasonal ARIMA) model was adopted. SARIMA caters to seasonality, allowing it to model univariate time series data exhibiting recurring patterns.

## Transition to SARIMAX

To further refine the predictions, SARIMAX (Seasonal ARIMA with eXogenous variables) was introduced. The 'type of incident' was used as the exogenous variable, enhancing the model's accuracy. SARIMAX is beneficial for modeling time series data with seasonality and integrating external variables for improved predictions.

### Exogenous Variables Visualization

Before modeling with SARIMAX, the daily occurrences of various incidents related to bus delays were visualized. Individual plots showcased each incident type over time, revealing potential patterns. The correlation between these incidents and `Min Delay` was calculated to gauge their impact on delays.

## Stationarity Testing

To ensure accurate time series analysis, the data's stationarity was verified using the ADF (Augmented Dickey-Fuller) and KPSS (Kwiatkowski-Phillips-Schmidt-Shin) tests. Stationary data has stable statistical properties over time, making it ideal for time series forecasting.

## Model Selection

The best model parameters were chosen based on:
- **AIC (Akaike Information Criterion):** Measures the goodness of fit of a statistical model and penalizes models with more parameters.
- **BIC (Bayesian Information Criterion):** Similar to AIC but with a stricter penalty for models with more parameters.
- **MSE (Mean Squared Error):** Represents the average squared difference between observed and predicted values.

## Model Evaluation

To ensure accurate predictions, the model's residuals (differences between predictions and actual values) were examined. A lack of patterns in the residuals over time, a normal distribution of residuals, and no auto-correlation (verified using ACF and PACF plots) confirmed the model's robustness.

### SARIMAX Model Components

The SARIMAX model used in this project had the following structure:
- ARIMA component: `order=(0,1,1)`
- Seasonal component: `seasonal_order=(0,1,1,7)`

## Prediction

The model was trained, and its predictions for July were compared with the test set, yielding an RMSE (Root Mean Squared Error) of 662.80 minutes. Given the complexity of the data, this RMSE indicates the model's respectable performance. The model was then used to predict the overall `Min Delay` for the entire dataset.

## Conclusion (Time Series Analysis)

This analysis offers a robust foundation for understanding and predicting bus delays in Toronto. The pursuit of even more accurate forecasting continues, with the hope of enhancing Toronto's transportation system efficiency.

## References
This data was taken from the Open Data Toronto portal (https://open.toronto.ca/dataset/ttc-bus-delay-data/) and is used for educational purposes only.

Tableau storyboard: https://public.tableau.com/shared/SXZX9QZWQ?:display_count=n&:origin=viz_share_link

Google Slide deck: https://docs.google.com/presentation/d/1wGkWYTlezbSzjKjrxqlzTlUGRyhHo5VHfscls4SugG0/edit?usp=sharing
