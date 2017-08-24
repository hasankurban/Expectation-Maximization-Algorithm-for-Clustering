# EM*: EM clustering algorithm for big data

## How to run EM*:

* python -c 'import main; main.model_eval("dataset",k,iteration,epsilon)'

   * dataset: the name of the dataset.
 
   * k : number of clusters

   * iteration: maximum number of iterations, such as 1000, 10000 e.g.,

   * epsilon: stopping criterion = 0.01 for EM*

##  Files:

   * main.py: Main file

   * readingData.py: Reading and  Preprocessing data — Note that for synthetic data sets the number of attributes should be updated in the file according to the data set.

   * heapEM.py: Implementation of EM*

   * heaping.py: build and update the heap

   * testing.py: calculates accuracy
##  Data Sets:
   * breast.cancer.txt
   * census.txt
   * galaxySurveyDataSet.txt
   * synthetic data sets: 16 different MVN data sets
