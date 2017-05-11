# Input example for the MVN generator

n = 15000  # number of data points for each cluster
d = 100    # number of features
k = 3      # number of clusters
mu1 = c(1,3,5)  # vector of center of clusters

#covariance matrices 
pdMat <- genPositiveDefMat(d,lambdaLow=0.1,ratioLambda = 10 , rangeVar = c(0.01,0.04))
sigma <- pdMat$Sigma

#load the function
source("mvnGenerator.R")
#call the function
syntheticData <- mix.MVN.data.generator(n,d,k,mu1,sigma)