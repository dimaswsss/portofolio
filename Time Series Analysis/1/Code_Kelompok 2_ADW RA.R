# load library
library(tseries)
library(forecast)
library(TSA)
library(Metrics)

# load data
data <- read.csv(file = "C:/Users/Dimas/Downloads/Tubes ADW/dataset/kereta/kereta_benar_2006.csv", header = FALSE)
head(data)

# try to plot time series
data_ts <- ts(data, start=c(2006, 1), end=c(2019, 12), frequency=12)
plot(data_ts, main="Plot Jumlah Penumpang Kereta Api (dalam Ribu)",
     xlab="Waktu",
     ylab="Jumlah Penumpang")
grid(nx = NULL, ny = NULL,
     lty = 2,      # Grid line type
     col = "gray", # Grid line color
     lwd = 2) 
points(y=data_ts, x=time(data_ts),pch=as.vector(season(data_ts)))
adf.test(data_ts) # belum stasioner

# try to differencing
diff_data = diff(log(data_ts))
plot(diff_data, main="Plot Jumlah Penumpang Kereta Api (dalam Ribu)\n Differencing Log",
     xlab="Waktu",
     ylab="Jumlah Penumpang")
grid(nx = NULL, ny = NULL,
     lty = 2,      # Grid line type
     col = "gray", # Grid line color
     lwd = 2) 
adf.test(diff(log(data_ts)))

# time series decompositon
#Decomposition break data into trend, seasonal, regular and random
plot(decompose(data_ts)) # time series decomposition
# It is clear that the time series is non-stationary (has random walks) because of seasonal effects and a trend (linear trend).

tsdata <- ts(log(data_ts), start=c(2006, 1), end=c(2019, 12),frequency = 12)
tsdata
par(mfrow=c(3,1))
acf(data_ts, lag = 30, main = 'ACF Data Tanpa Differencing')
acf(diff(log(data_ts)), main = 'ACF Data Setelah Differencing', lag = 30) #It determine value of q(value we got as 0)
pacf(diff(log(data_ts)), main = 'PACF Data Setelah Differencing', lag = 30)  #It determine value of p (value we got as 0)
#d is number of time you do the differentiations to make the mean
#We do diff only one time so value of d is 1
plot(diff(log(data_ts)))

# auto arime use aic
arimaAP <- auto.arima(data_ts, trace=TRUE, ic="aic")
arimaAP

# Model Diagnostic
ggtsdiag(arimaAP)

# Prediksi menggunakan model
forecastAP <- forecast(arimaAP, level = c(95), h = 30)
forecastAP
autoplot(forecastAP, main = 'Hasil Prediksi dari Model')