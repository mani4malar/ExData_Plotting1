plot1<-function(){
library(downloader)

download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="household_power_consumption.zip")

unzip("C:/Users/IBM_ADMIN/Documents/household_power_consumption.zip")

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactor=FALSE)

subset_data<-subset(data,(Date=="1/2/2007"|Date=="2/2/2007"))

Global_active_power<-as.numeric(subset_data$Global_active_power)

dev.cur()

png(filename="plot1.png",width=480,height=480,unit="px")


hist(Global_active_power,col="red",main="Global_active_power",xlab="Global_active_power (kilowatts)")

dev.off()

}





