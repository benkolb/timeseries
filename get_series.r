
# Download time series from Eurostat
# Benedikt Kolb, July 2014

library(rdatamarket)
library(xts)
#library(xtsExtra)

# Housekeeping
wd = "C:/Users/Benedikt/Documents/Github/timeseries"

## from datamarket.com
# GDP of Eurozone(27) (quarterly, nominal)
gdpnq_raw <- dmseries("http://datamarket.com/data/set/18qt/gdp-and-main-components-current-prices#!ds=18qt!mh2=1:mh3=8:mh4=b:mh5=m")
gdpnq <- as.xts(gdpnq_raw)
names(gdpnq) <- "GDPnq"

# Merge dataset and assemble csv file
d <- merge(gdpnq)

write.csv(d, paste(wd,"/series.csv", sep=""), quote=FALSE) # c("date","GDPnq")

