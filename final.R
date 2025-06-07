library(astsa)
library(forecast)
load("D:/sta专业课/STA137/final project/finalproject.Rdata")
# subset
GDP = finalPro_data$GDP
imports = finalPro_data$Imports

# step 1: plot
ts.plot(GDP, main = "GDP")
ts.plot(imports, main = "Imports")

# log transform
log_GDP = log(GDP)
log_imports = log(imports)
ts.plot(log_GDP, main = "log-GDP")
ts.plot(log_imports, main = "log-imports")

acf(log_GDP)
pacf(log_GDP) # AR(1)
acf(log_imports)
pacf(log_imports) # AR(1)
model_log_GDP = arima(log_GDP, order = c(1, 0, 0))
model_log_imports = arima(log_imports, order = c(1, 0, 0))
# diagnose: log_GDP AR(1)
qqnorm(log_GDP, main = "log_GDP")
qqline(log_GDP)
tsdiag(model_log_GDP)
# diagnose: log_imports AR(1)
qqnorm(log_imports, main = "log_imports")
qqline(log_imports)
tsdiag(model_log_imports)


# Forecast
forecast(model_log_GDP, level=c(80,95))
forecast(model_log_imports, level=c(80,95)) 

autoplot(forecast(model_log_GDP, level=c(80,95)))
autoplot(forecast(model_log_imports, level=c(80,95)))



