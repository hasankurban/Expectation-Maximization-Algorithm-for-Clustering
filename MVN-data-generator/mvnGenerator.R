#Loading the packages
require(MASS)
require(clusterSim)
require(matrixcalc)
require(clusterGeneration)
require(ggplot2)

mix.MVN.data.generator <- function(n,d,k,mu1,sigma){
    syntheticData = NULL
    for (i in 1:k){
      mu <- rep(mu1[i],d) 
      class <- as.data.frame(rep(i-1,n))
      ex=mvrnorm(n,mu,sigma)
      tempData <- cbind(ex,class)
      names(tempData) <- c(0:d+1)
      syntheticData <- rbind(syntheticData,tempData)
    }
    #Coercing the cluster numbers to factors
    syntheticData[,d+1] <- as.factor(syntheticData[,d+1])
    #Writing the data
    write.csv(syntheticData, file = "synData.txt",row.names=FALSE)
    return(syntheticData)
  }