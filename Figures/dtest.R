dtest <- data.frame(matrix(ncol = 5, nrow = 22))
names(dtest) <- c("iterationCount","executionTime", "accuracy","Algorithm","d")
dtest[1,] <- c(228,56,100,1,20)
dtest[2,] <- c(14,5,100,2,20)
dtest[3,] <- c(359,134,100,1,40)
dtest[4,] <- c(14,7,100,2,40)
dtest[5,] <- c(253,149,100,1,60)
dtest[6,] <- c(17,11,100,2,60)
dtest[7,] <- c(188,159,100,1,80)
dtest[8,] <- c(27,15,100,2,80)
dtest[9,] <- c(176,201,100,1,100)
dtest[10,] <- c(21,23,100,2,100)
dtest[11,] <- c(123,271,100,1,150)
dtest[12,] <- c(22,42,100,2,150)
dtest[13,] <- c(70,211,100,1,200)
dtest[14,] <- c(17,47,100,2,200)
dtest[15,] <- c(45,180,100,1,250)
dtest[16,] <- c(17,64,100,2,250)
dtest[17,] <- c(26,137,100,1,300)
dtest[18,] <- c(14,68,100,2,300)
dtest[19,] <- c(9,81,100,1,400)
dtest[20,] <- c(9,69,100,2,400)
dtest[21,] <- c(9,85,100,1,450)
dtest[22,] <- c(9,83,100,2,450)


dtest[,5] <- as.factor(dtest[,5])
dtest[,4] <- as.factor(dtest[,4])

ggplot(data=dtest, aes(x=d, y=executionTime, group=Algorithm, color=Algorithm)) +
  geom_line() + scale_fill_discrete(name = "Algorithms",labels=c("EM", "heapEM"))+
  geom_point() +xlab("Number of Dimensions d") + ylab("Training Time in seconds") 
  


d1<-ggplot(data=dtest, aes(x=d, y=executionTime, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position="none") + 
  xlab("Number of Dimensions d") + ylab("Training Time in seconds") + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithm",
                                                                                      breaks=c( "1", "2"),
                                                                                      labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=12,face = "bold"),axis.title = element_text(face="bold"))


d2<- ggplot(data=dtest, aes(x=d,y=accuracy, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position="none") + 
  xlab("Number of Dimensions d") + ylab("Accuracy (%)")  + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithms",
                                                                           breaks=c( "1", "2"),
                                                                           labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15,face = "bold"),axis.title = element_text(face="bold")) 

d3<- ggplot(data=dtest, aes(x=d, y=iterationCount, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position=c(0.80, .75))+ 
  xlab("Number of Dimensions d") + ylab("Iteration Count") + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithm",
                                                                             breaks=c( "1", "2"),
                                                                             labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15,face = "bold"),axis.title = element_text(face="bold"))+
  ggtitle("Experimenting Dimensionality")


