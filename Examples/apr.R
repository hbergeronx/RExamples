apr_times <- read.csv("~/Google Drive/apr_times.csv")
apr2 <- subset(apr_times, seconds > 0)
apr <- subset(apr2, spc <200)
apr$month <- as.Date(paste(strftime(strptime(apr$start,"%d-%b-%Y"),"%Y-%b"),"-01",sep=""),"%Y-%b-%d")
apr$dps = round(apr$datapoints/apr$seconds,1)
apr$datpercht <- round(apr$datapoints/apr$charts)
apr$minutes <- round(apr$seconds/60,2)
HER2 <- subset(apr, product="HER2")


ggplot(apr)+geom_boxplot(aes(y=charts,x=reorder(format(apr$month,'%B-%Y'),apr$month),fill=format(apr$month,'%Y')))+xlab('Month') + guides(fill=guide_legend(title="Year")) +theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggplot(apr, aes(day, datpercht, color=product))+geom_point()+ylim(0,200)
ggplot(apr)+geom_boxplot(aes(y=datpercht,x=reorder(format(apr$month,'%B-%Y'),apr$month),fill=format(apr$month,'%Y')))+xlab('Month') + guides(fill=guide_legend(title="Year")) +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ylim(0,200)
