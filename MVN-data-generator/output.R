# Sampling, Normalizing, Plotting  the synthetic data set

#Vieving data
View(syntheticData)

#Incase you want take a sample from the data
syntheticData <- syntheticData[sample(nrow(syntheticData)),]

#In case you want to normalize data
syntheticData[,1:d] <- data.Normalization(syntheticData[,1:d],type="n2",normalization="column")

#Plotting the data
qplot(syntheticData[,1], syntheticData[,2], colour = syntheticData[,d+1],data = syntheticData)+ xlab("Variable 1") + ylab("Variable 2") + 
 labs(colour="Gaussian\nDistribution") +theme(legend.position=c(0.12, 0.8))+
  theme(panel.background = element_rect(fill = "white"),plot.title = element_text(size=15))