

!!!Fill in your work_dir


fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
work_dir<-"..."
setwd(work_dir)


# check whether file is already downloaded and download if not
if (!file.exists("exdata-data-household_power_consumption.zip")) download.file(fileurl, destfile<-"exdata-data-household_power_consumption.zip",  method = "libcurl")

#unpack
if (!file.exists("household_power_consumption.txt")) unzip("exdata-data-household_power_consumption.zip")


#starting reading file
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)

data$Time = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date = as.Date(data$Date, "%d/%m/%Y")

data_2<-data[data$Date>=as.Date("01/02/2007", "%d/%m/%Y") & data$Date<=as.Date("02/02/2007", "%d/%m/%Y"),]


hist(as.numeric(paste(data_2$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


dev.copy(png,'plot1.png',  width=480, height=480)
dev.off()