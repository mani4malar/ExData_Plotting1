plot2<-function() {
library(downloader)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="household_power_consumption.zip")
unzip("C:/Users/IBM_ADMIN/Documents/household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactor=FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
subset_data<-subset(data,(Date=="2007-2-1"|Date=="2007-2-2"))
subset_data<-transform(subset_data,date_time=paste(as.character(subset_data$Date),subset_data$Time))
datetime<-strptime(subset_data$date_time,format="%Y-%m-%d %H:%M:%S")
Global_active_power<-as.numeric(subset_data$Global_active_power)
dev.cur()
png(filename="plot2.png",width=480,height=480,unit="px")
plot(datetime,Global_active_power,type="l",xlab="")
dev.off() }


