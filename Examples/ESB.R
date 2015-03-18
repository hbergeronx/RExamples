library("ggplot2")
E <- read.csv("~/Downloads/ESBHeartbeat.csv", header=FALSE)
E$type <- relevel(relevel(factor(E$V1),"Lot Sample Updated or Logged"),"LIMS Heartbeat")
E$V4 <- as.POSIXct(strptime(E$V3, "%m/%d/%y %I:%M %p"))
E$V5 <- strftime(E$V4, "%y-%m-%d %H")
E$date <- as.POSIXct(strptime(E$V5, "%y-%m-%d %H"))
range <- as.POSIXct(strptime(c("2015-03-09 12:00:00", "2015-03-17 12:00:00"), "%Y-%m-%d %H:%M:%S"))
p <- ggplot(E,aes(date,fill=type))+geom_bar(binwidth=10800)+scale_x_datetime(name="Date of transaction (GMT)",limits=range)+scale_y_continuous("Heartbeats per 3 hr period",breaks=c(30,60,90,120,150,180,210,240,270,300))
p
