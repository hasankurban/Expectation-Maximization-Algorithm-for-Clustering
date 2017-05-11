# @Hasan Kurban, 2016, IUB, Computer Scince Department
import testing
import collections
import pandas as pd, numpy as np,sys

def test(y_testing,W,data): #pred is our prediction. pred1 is from the data
    #THIS PART IS FOR TRUE CLUSTERS 
    uniqueItems1 = np.unique(y_testing) #unique clusters or classes
    d = data.shape[1]
    nclust1 = len(uniqueItems1) #number or unique clusters
    means1 = np.zeros((nclust1,d),dtype=float) # to store mean of the true clusters
    list_testing1 = y_testing.tolist()  #coercing y_testing to a list
    # means for true clusters
    for i in range(len(uniqueItems1)):
        item = uniqueItems1[i]
        indices = [j for j, x in enumerate(list_testing1) if x == item]
        means1[i] = data[indices].mean(axis=0)
    #THIS PART  IS FOR PREDICTION, HANDLING PREDICTIONS
    pred= W.argmax(axis=0)
    uniqueItems2 = np.unique(pred)
    nclust2 = len(uniqueItems2)
    means2 = np.zeros((nclust2,d),dtype=float)
    list_testing2 = pred.tolist()
    for i in range(len(uniqueItems2)):
        item = uniqueItems2[i]
        indices = [k for k, x in enumerate(list_testing2) if x == item]
        means2[i] = data[indices].mean(axis=0)
    prediction = []
    #Arrange cluster numbers
    for i in range(means2.shape[0]):
        temp= []
        for j in range(means1.shape[0]):     
            temp.append(np.linalg.norm(means2[i]-means1[j]))
        prediction.append(uniqueItems1[temp.index(min(temp))]) #fixing cluster numbers
    listuniqueItems2 = uniqueItems2.tolist()
    for i in range(len(pred)):
        temp3   = listuniqueItems2.index(pred[i])
        pred[i] = prediction[temp3]
    accuracy = float(np.sum(y_testing == pred)) / len(pred)
    accuracy = round(accuracy,2) 
    return accuracy       