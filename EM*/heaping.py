# @Hasan Kurban, 2016, IUB, Computer Scince Department
import numpy as np, heapq
import heaping

def buildHeap(data,W,n,d,nclust): #build heap
	heaps = [[] for i in range(nclust)] #build max heap for each cluster
	maxIndex = W.argmax(axis=0)  # predict the cluster
	for i in range(n):  #build the heaps
		heaps[maxIndex[i]].append([W[maxIndex[i],i],i])
	for h in range(nclust):  
		heapq._heapify_max(heaps[h])
	heaps,badDataIndex,badData,temp1 =	heaping.seperateGoodBad(data,nclust,heaps,d)			
	return heaps,badDataIndex,badData,temp1 
	 
def _heappush_max(heap, item):
	heap.append(item)
	heapq._siftdown_max(heap, 0, len(heap)-1)

def newHeap(data,heaps,W1,badDataIndex,d,nclust): #updating heap
	maxIndex = W1.argmax(axis=0)
	for i in range(len(badDataIndex)): 
		heaping._heappush_max(heaps[maxIndex[i]],[W1[maxIndex[i],i],badDataIndex[i][1]])
	heaps,badDataIndex,badData,temp2 =	heaping.seperateGoodBad(data,nclust,heaps,d)
	return heaps,badDataIndex,badData,temp2

def seperateGoodBad(data,nclust,heaps,d): # seperate good data and bad data
	leaves = [[] for i in range(nclust)]
	for l in range(nclust):	
	   leaves[l] = heaps[l][len(heaps[l])/2:len(heaps[l])] #bad data
	   heaps[l] = heaps[l][0:len(heaps[l])/2] #good data
	badDataIndex = sum(leaves, [])
	badDataIndexLen = len(badDataIndex)  
	badData = np.zeros((badDataIndexLen,d),dtype=float)
	temp =[]
	for j in range(badDataIndexLen):
		 badData[j] = data[badDataIndex[j][1]]
		 temp.append(badDataIndex[j][1])
	return heaps,badDataIndex,badData,temp