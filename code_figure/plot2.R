##download zip in temporary file
file="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp01 <- tempfile()
download.file(file,temp01)
##unzip file
temp02<-unzip(temp01)
##identify lines to keep
lines <- grep('^[1-2]/2/2007', readLines(temp02))

##generate dataset and prepare for plotting
dataset<-read.table(temp02,header=TRUE,sep=";")
  data<-dataset[lines,]

  data$Time<- as.POSIXlt(paste(data$Date, data$Time),tz="GMT", format='%d/%m/%Y %H:%M:%S')
  data[,3]<-as.numeric(as.character(data[,3]))

##save plotted graph to png file.
png(file="plot2.png")
  plot(data[,2],data[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
