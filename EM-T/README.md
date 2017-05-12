# EM-T:  Traditional EM algorithm for clustering

## How to run EM-T:

* python -c 'import main; main.model_eval("dataset",k,iteration,epsilon)'

   * dataset: the name of the dataset.
 
   * k : number of clusters

   * iiteration: maximum number of iterations, such as 1000, 100000 e.g.,

   * epsilon: stopping criterion = 0.01, 0.001,0.0001 for EM-T

##  Files:

   * main.py: Main file

   * readingData.py: Reading and  Preprocessing data ? Note that for synthetic data sets the number of attributes should be updated in the file according to the data set

   * EM.py: Implementation of EM-T

   * heaping.py: build and update the heap
   
   * main.py : Main file

   * testing.py: calculates accuracy
   
##  Data Sets:
   * breast.cancer.txt
   * census.txt
   * galaxySurveyDataSet.txt
   * synthetic data sets: 16 different MVN data sets
   
   


