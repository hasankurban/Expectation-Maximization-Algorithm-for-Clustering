# @Hasan Kurban, 2016
import numpy as np ,sys, time, heaping,heapEM
from scipy.stats import multivariate_normal

#E-step: Given P(x_i|C_j), calculate P(C_j|x_i)
def e_step(data, mu, sigma,prior,nclust):
    n,d= data.shape
    W  = np.zeros((nclust,n),dtype=float) #P(C|x)
    for k in range(nclust):
        W[k] = (multivariate_normal.pdf(data, mean=mu[k], cov=sigma[k],allow_singular=True)) * prior[k]
    temp2= W.sum(axis=0)
    W = W / temp2
    return W

# M-step: Updata mu, sigma, prior for each cluster
def m_step(data, W, mu, sigma,nclust):
    n= data.shape[0]
    for t in range(nclust):
        temp3 = (data -mu[t])*  W.T[:,t][:,np.newaxis]
        temp4 = (data-mu[t]).T
        sigma[t] = np.dot(temp4,temp3)  / W.sum(axis=1)[t]
        mu[t] = (data *  W.T[:,t][:,np.newaxis]).sum(axis=0)/ W.sum(axis=1)[t]
    prior =W.sum(axis=1)/n 
    return mu, sigma, prior

def em_clustering(data,nclust,maxiter,epsilon): 
    #Initialization of mean, covariance, and prior
    n,d = data.shape
    mu = np.zeros((nclust,d),dtype=float)  #mu.shape(nclust,d)
    sigma = np.zeros((nclust,d,d),dtype=float) #sigma.shape(k, d, d) 
    for t in range(nclust): # assigning the first nclust points to the mu
        mu[t] = data[t]
        sigma[t] = np.identity(d)    
    prior = np.asarray(np.repeat(1.0/nclust,nclust),dtype=float) #for each cluster one prior:
    #buildHeap heaps : 
    W= heapEM.e_step(data,mu, sigma,prior,nclust) #calling E-step funct. 
    mu, sigma, prior = heapEM.m_step(data, W, mu, sigma,nclust) # calling M-step funct. 
    heaps,badDataIndex,badData,temp1 = heaping.buildHeap(data,W,n,d,nclust)
     #Updating Heap
    for i in range(maxiter):   
        W1= heapEM.e_step(badData,mu, sigma,prior,nclust)
        # Updating weight for bad data points:
        for k in range(len(badDataIndex)):
            for c in range(nclust):
                 W[c,badDataIndex[k][1]]= W1[c,k]
        mu, sigma, prior = heapEM.m_step(data, W, mu, sigma,nclust)#M-step
        heaps,badDataIndex,badData,temp2= heaping.newHeap(data,heaps,W1,badDataIndex,d,nclust)  # Updating heaps:
        s = set(temp1)
        temp3 = [y for y in temp2 if y not in s]
        dissimilarity = round(float(len(temp3))/len(temp2),4)
        #print  "Iteration number = %d, stopping criterion = %.4f" %(i+1,dissimilarity) 
        if dissimilarity <= epsilon:
            break
        temp1 = 1* temp2 
    return mu,sigma,prior