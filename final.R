library(astsa)
load("D:/sta专业课/STA137/final project/finalproject.Rdata")
ls()
# subset
GDP = finalPro_data$GDP
imports = finalPro_data$Imports

# step 1: plot
ts.plot(GDP, main = "GDP")
ts.plot(imports, main = "Imports")

# difference: d = 1
diff_GDP <- diff(GDP)
ts.plot(diff_GDP)
acf(diff_GDP)
pacf(diff_GDP)
# MA(1) MODEL for GDP

#____________________________________________
diff_imports <- diff(imports)
ts.plot(diff_imports)
acf(diff_imports)
pacf(diff_imports)

# transform
log_GDP = log(GDP)
log_imports = log(imports)
ts.plot(log_GDP, main = "log-GDP")
ts.plot(log_imports, main = "log-imports")

acf(log_GDP)
pacf(log_GDP)

acf(log_imports)
pacf(log_imports)
# AR(1)