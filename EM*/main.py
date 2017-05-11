# @Hasan Kurban, 2016, IUB, Computer Scince Department
# main file for EM clustering algorithm
import heapEM, readingData,testing
import numpy as np,time

def model_eval(dataFile,nclust,maxiter,epsilon): 
     #reading data: X- data, y- class att.
    X,y = readingData.dataPrep(dataFile) 
    #training
    start_time = time.time()
    mu,sigma,prior = heapEM.em_clustering(X,nclust,maxiter,epsilon)
    TraningTime = time.time() - start_time
    #testing
    W= heapEM.e_step(X,mu,sigma,prior,nclust)
    accuracy = testing.test(y,W,X)
    TraningTime = round(TraningTime,3)
    accuracy = int(round(accuracy*100))
    print(" Traning running time :%s seconds " % TraningTime) 
    print( "accuracy:%s%%" % accuracy) 