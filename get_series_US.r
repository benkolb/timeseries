
# Download time series for US economy
# Benedikt Kolb, August 2014

library(rdatamarket)
library(xts)
library(ggplot2)
#library(xtsExtra)

# Housekeeping
wd = "C:/Users/Benedikt/Documents/Github/timeseries"

## from datamarket.com

# GDP (quarterly, nominal)

gdp <- as.xts(dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=6:mh5=13"))
names(gdp) <- "nom.GDP"
gdp_desc <- c("Gross domestic product at market prices","Million dollars","1970Q1","Eurostat","Seasonally adjusted and adjusted data by working days","http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=b:mh5=13&display=line")

# Consumption (as of GDP)

cons <- as.xts(dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=b:mh5=13"))
names(cons) <- "Cons."
cons_desc <- c("Household and NPISH final consumption expenditure","Million dollars","1970Q1","Eurostat","Seasonally adjusted and adjusted data by working days","http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=6:mh5=13&display=line")

# Investment (as of GDP)

inv <- as.xts(dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=j:mh5=13"))
names(inv) <- "Inv."
inv_desc <- c("Gross capital formation","Million dollars","1970Q1","Eurostat","Seasonally adjusted and adjusted data by working days","http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=j:mh5=13&display=line")

# Government consumption (as of GDP)

gcons <- as.xts(dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=q:mh5=13"))
names(gcons) <- "Gov.Cons."
gcons_desc <- c("Final consumption expenditure of general government","Million dollars","1970Q1","Eurostat","Seasonally adjusted and adjusted data by working days","http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=q:mh5=13&display=line")

# Exports (as of GDP)

expo <- as.xts(dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=h:mh5=13"))
names(expo) <- "Exports"
expo_desc <- c("Exports of goods and services","Million dollars","1970Q1","Eurostat","Seasonally adjusted and adjusted data by working days","http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=h:mh5=13&display=line")

# Imports (as of GDP)

impo <- as.xts(dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=d:mh5=13"))
names(impo) <- "Imports"
impo_desc <- c(" Imports of goods and services","Million dollars","1970Q1","Eurostat","Seasonally adjusted and adjusted data by working days","http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=9:mh4=d:mh5=13&display=line")


# Consumer prices

cpi <- as.xts(dmseries("http://datamarket.com/data/set/3dra/personal-consumption-expenditures-implicit-price-deflator#!ds=3dra"))
names(cpi) <- "CPI"
cpi_desc <- c("Personal consumption expenditures (implicit price deflator)","Index 2009=100","1947Q1","Federal Reserve Bank of St. Louis (citing: U.S. Department of Commerce: Bureau of Economic Analysis)","http://datamarket.com/data/set/3dra/personal-consumption-expenditures-implicit-price-deflator#!ds=3dra&display=line")

# Money

moneym <- as.xts(dmseries("http://datamarket.com/data/set/3nqn/monetary-base-currency-in-circulation#!ds=3nqn"))
money <- to.quarterly(moneym)[,1]
names(money) <- "M0"
money_desc <- c("Monetary Base; Currency In Circulation","Millions of Dollars","1959M1","Federal Reserve Bank of St. Louis (citing: Board of Governors of the Federal Reserve System)","http://datamarket.com/data/set/3nqn/monetary-base-currency-in-circulation#!ds=3nqn&display=line")

# Nom. interest rates

nratem <- as.xts(dmseries("http://datamarket.com/data/set/1k1q/effective-federal-funds-rate-monthly-data#!ds=1k1q"))
nrate <- to.quarterly(nratem)[,1]
names(nrate) <- "FFR"
nrate_desc <- c("Effective Federal Funds Rate (Monthly Data)","Percent","1954M7","Federal Reserve Bank of St. Louis (citing: Board of Governors of the Federal Reserve System)","http://datamarket.com/data/set/1k1q/effective-federal-funds-rate-monthly-data#!ds=1k1q&display=line")

# Hours

hours <- as.xts(dmseries("http://datamarket.com/data/set/1kop/nonfinancial-corporations-sector#!ds=1kop!1l9q=6.k:1l9s=1"))
names(hours) <- "Hours"
hours_desc <- c("Average Weekly Hours, Nonfinancial Corporation Sector","Index 2005=100","1947Q1"," Federal Reserve Bank of St. Louis (citing: U.S. Department of Labor: Bureau of Labor Statistics)","http://datamarket.com/data/set/1kop/nonfinancial-corporations-sector#!ds=1kop!1l9q=6.k:1l9s=1&display=line")

# Real wage

wages <- as.xts(dmseries("http://datamarket.com/data/set/1kop/nonfinancial-corporations-sector#!ds=1kop!1l9q=k.e:1l9s=1"))
#wages <- as.xts(wages_raw)
names(wages) <- "Wages"
wages_desc <- c("Real Hourly Compensaton, Nonfinancial Corporation Sector","Index 2005=100","1947Q1"," Federal Reserve Bank of St. Louis (citing: U.S. Department of Labor: Bureau of Labor Statistics)","http://datamarket.com/data/set/1kop/nonfinancial-corporations-sector#!ds=1kop!1l9q=k.e:1l9s=1&display=line")


# Merge dataset and assemble csv file
d <- merge(gdp,cons,inv,hours,wages,cpi,money,nrate)
date <- as.zoo(index(d))
d <- merge(d,date)
d <- merge(d[,9],d[,1:8]) # find better way to reorder xts object!
d <- na.omit(d) # find better way to reorder xts object!

write.csv(d, paste(wd,"/dataUS.csv", sep=""), quote=FALSE)

# plot dataset
titles <- c("Nom. GDP","Pr. Cons.","Inv.")
#par(mfrow=c(3,4))
plot.xts(d[,1],
         auto.grid=FALSE,
         main=NA,
         minor.ticks=FALSE,
         major.format = "%Y")
title(main=titles[1])



