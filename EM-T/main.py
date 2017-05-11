# @Hasan Kurban, 2016, IUB, Computer Scince Department
# main file for EM clustering algorithm
import EM, readingData,testing
import numpy as np,time

def model_eval(dataFile,nclust,maxiter,epsilon): 
    #reading data: X- data, y- class att.
    X,y = readingData.dataPrep(dataFile) 
    #training
    start_time = time.time()
    mu,sigma,prior = EM.em_clustering(X,nclust,maxiter,epsilon)
    averageTraningTime = time.time() - start_time
    #testing
    W= EM.e_step(X,mu,sigma,prior,nclust)
    accuracy = testing.test(y,W,X)
    averageTraningTime = round(averageTraningTime,3)
    accuracy = int(round(accuracy*100))
    print(" Traning running time :%s seconds " % averageTraningTime) 
    print( "accuracy:%s%%" % accuracy)                     