#require(clusterSim)
gs1 <-read.csv("GS1.csv",sep=",",header=T)
gs1 <- gs1[,c(1,3,6,7,8)]
gs1[,1] <- as.factor(gs1[,1])
gs1[,2:5] <- data.Normalization(gs1[,2:5],type="n1",normalization="column")
write.csv(gs1, file = "hadibakalim2.txt",row.names=FALSE)
qplot(gs1[,2], gs1[,3], colour = gs1[,1],data = gs1) +
  xlab("log of effective temperature") + ylab("gs1ss ratio") +
  labs(colour="Galactic Components") + ggtitle("Galactic Survey Data") +
  scale_colour_discrete(labels=c("halo","thick disc","thin disc"))


