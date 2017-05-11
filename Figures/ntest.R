ntest <- data.frame(matrix(ncol = 5, nrow = 14))
names(ntest) <- c("iterationCount","executionTime", "accuracy","Algorithm","n")
ntest[1,] <- c(490,10782,100,1,1.5)
ntest[2,] <- c(17,678,100,2,1.5)
ntest[3,] <- c(405,18844,100,1,3)
ntest[4,] <- c(13,748,100,2,3)
ntest[5,] <- c(38,2508,100,1,4.5)
ntest[6,] <- c(13,1137,100,2,4.5)
ntest[7,] <- c(77,6866,100,1,6)
ntest[8,] <- c(13,1533,100,2,6)
ntest[9,] <- c(42,4653,100,1,7.5)
ntest[10,] <- c(12,1780,100,2,7.5)
ntest[11,] <- c(36,4806,100,1,9)
ntest[12,] <- c(13,2387,100,2,9)
ntest[13,] <- c(40,6160,100,1,10.5)
ntest[14,] <- c(14,3224,100,2,10.5)
ntest[,5] <- as.factor(ntest[,5])
ntest[,4] <- as.factor(ntest[,4])


n1<-ggplot(data=ntest, aes(x=n, y=executionTime, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+  theme(legend.position="none") + 
  xlab("Number of Data Points in millions") + ylab("Training Time in seconds") + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithm",
                                                                                      breaks=c( "1", "2"),
                                                                                      labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=12,face = "bold"),axis.title = element_text(face="bold"))


n2<- ggplot(data=ntest, aes(x=n,y=accuracy, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position="none") + 
  xlab("Number of Data Points in millions") + ylab("Accuracy (%)")  + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithms",
                                                                           breaks=c( "1", "2"),
                                                                           labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15,face = "bold"),axis.title = element_text(face="bold")) 
  

n3<- ggplot(data=ntest, aes(x=n, y=iterationCount, fill=Algorithm)) + theme(legend.position=c(0.64, .65))+
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+  
  xlab("Number of Data Points in millions") + ylab("Iteration Count") + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithm",
                                                                             breaks=c( "1", "2"),
                                                                             labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15,face = "bold"),axis.title = element_text(face="bold"))+
  ggtitle("Experimenting Scalability")

