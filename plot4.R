plot4<-function()
{
library(downloader)

download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata##%2Fhousehold_power_consumption.zip",dest="household_power_consumption.zip")

unzip("C:/Users/IBM_ADMIN/Documents/household_power_consumption.zip")

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactor=FALSE)

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

subset_data<-subset(data,(Date=="2007-2-1"|Date=="2007-2-2"))

subset_data<-transform(subset_data,date_time=paste(as.character(subset_data$Date),subset_data$Time))

subset_data$date_time<-strptime(subset_data$date_time,format="%Y-%m-%d %H:%M:%S")

subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)
subset_data$Voltage<-as.numeric(subset_data$Voltage)
subset_data$Global_reactive_power<-as.numeric(subset_data$Global_reactive_power)



dev.cur()

png(filename="plot4.png",width=480,height=480,unit="px")

par(mfrow=c(2,2),mar=c(5,4,4,2))
with(subset_data,plot(date_time,Global_active_power,type="l",xlab=""))
with(subset_data,plot(date_time,Voltage,type="l",xlab=""))

with(subset_data,plot(date_time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(subset_data,points(date_time,Sub_metering_2,col="red",type="l"))
with(subset_data,points(date_time,Sub_metering_3,col="blue",type="l"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(subset_data,plot(date_time,Global_reactive_power,type="l"))



dev.off()
}


