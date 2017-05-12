#Synthetic Data Experiments: Cluster Numbers


ktest <- data.frame(matrix(ncol = 5, nrow = 20))
names(ktest) <- c("iterationCount","executionTime", "accuracy","Algorithm","k")
ktest[1,] <- c(199,17,100,1,10)
ktest[2,] <- c(11,3,100,2,10)
ktest[3,] <- c(668,112,100,1,20)
ktest[4,] <- c(13,4,100,2,20)
ktest[5,] <- c(843,214,100,1,30)
ktest[6,] <- c(13,6,100,2,30)
ktest[7,] <- c(1000,351,100,1,40)
ktest[8,] <- c(13,9,100,2,40)
ktest[9,] <- c(1000,457,100,1,50)
ktest[10,] <- c(13,10,100,2,50)
ktest[11,] <- c(1000,578,100,1,60)
ktest[12,] <- c(13,12,100,2,60)
ktest[13,] <- c(1000,697,100,1,70)
ktest[14,] <- c(13,14,100,2,70)
ktest[15,] <- c(1000,844,100,1,80)
ktest[16,] <- c(13,16,100,2,80)
ktest[17,] <- c(1000,1040,100,1,90)
ktest[18,] <- c(13,18,100,2,90)
ktest[19,] <- c(1000,1123,100,1,100)
ktest[20,] <- c(13,21,100,2,100)


ktest[,5] <- as.factor(ktest[,5])
ktest[,4] <- as.factor(ktest[,4])


k1<-ggplot(data=ktest, aes(x=k, y=executionTime, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position="none") + 
  xlab("Number of Clusters k") + ylab("Training Time in seconds") + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithm",
                                                                                      breaks=c( "1", "2"),
                                                                                      labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=12,face = "bold"),axis.title = element_text(face="bold"))


k2<- ggplot(data=ktest, aes(x=k,y=accuracy, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position="none") + 
  xlab("Number of Clusters k") + ylab("Accuracy (%)")  + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithms",
                                                                           breaks=c( "1", "2"),
                                                                           labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15,face = "bold"),axis.title = element_text(face="bold")) 

k3<- ggplot(data=ktest, aes(x=k, y=iterationCount, fill=Algorithm)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black",size=0.3)+ theme(legend.position="none")+ 
  xlab("Number of Clusters k") + ylab("Iteration Count") + scale_fill_manual(values=c("red3","lightblue1"),name="Algorithm",
                                                                             breaks=c( "1", "2"),
                                                                             labels=c( "EM-T", "EM*"))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15,face = "bold"),axis.title = element_text(face="bold"))+
annotate("text", label = "EM-T FAILED to converge in 1000 iterations",fontface="bold", x = 6.7, y = 1075, size = 4, colour = "blue")+
  ggtitle("Experimenting Cluster Numbers")

