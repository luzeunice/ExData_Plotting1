## Luz Eunice

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
## format to the columns 
  data[,1]<-as.Date(data[,1], format = "%d/%m/%Y")
  data[,3]<-as.numeric(as.character(data[,3]))

## Graph 1 
hist(data[,3],col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",ylim=c(1,1200))

##save plotted in png fie. 
png(file="plot1.png")
 hist(data[,3],col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",ylim=c(1,1200))
## Colse png file
dev.off()
