# @Hasan Kurban, 2016, IUB, Computer Scince Department
#Reading data and preprocessing data. Currently, breast cancer data set is active.   
import pandas as pd, numpy as np
import sys
#np.set_printoptions(threshold=np.nan)

def dataPrep(filename): # input a data frame
    #census.txt 
    '''
    data = pd.read_csv(filename)
    pred1 = data.iloc[:,-1]
    data = data.iloc[:,0:6] # subset the data
    data = np.asarray(data,dtype=float)
    pred1 = np.asarray(pred1,dtype=int)
    n,d = data.shape
    '''
    #galaxySurveyDataSet.txt
    '''
    data = pd.read_csv(filename,sep=',')    
    pred1 = data.iloc[:,0]
    data = data.iloc[:,1:4]
    data = data.dropna()
    data = np.asarray(data,dtype=float)
    pred1 = np.asarray(pred1)
    n,d = data.shape
    ''' 
    #breastcancer.txt
    data = pd.read_csv(filename, header=None)
    data = data.replace('?', np.NaN)
    data = data.dropna()
    pred1 = data.iloc[:,-1]
    data = data.iloc[:,1:10] # subset the data
    data = np.asarray(data,dtype=float)
    pred1 = np.asarray(pred1)
    n,d = data.shape 
    # Experiments with the synthetic datasets:
    '''
    data = pd.read_csv(filename)
    #data = data.replace('?', np.NaN)
    #data = data.dropna()
    pred1 = data.iloc[:,-1]
    # this part must be editted depinding on the synthetic data set is being used
    data = data.iloc[:,0:20] 
    data = np.asarray(data,dtype=float)
    pred1 = np.asarray(pred1)
    n,d 
    '''
    return data, pred1