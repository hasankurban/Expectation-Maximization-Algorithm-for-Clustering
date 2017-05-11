# @Hasan Kurban, 2016, IUB, Computer Scince Department
IMPLEMENTATION OF EM* ALGORITHM

How to run EM*:

1- python -c 'import main; main.model_eval("dataset",k,iteration,epsilon)'
 
k : number of clusters

iteration: maximum number of iterations, such as 1K, 10K e.g.,

epsilon: stopping criterion = 0.01 for EM*

2- Files:
main.py: Main file

readingData.py: Reading and  Preprocessing data — Note that for synthetic data sets the number of attributes should be updated in the file according to the data set.

heapEM.py: Implementation of EM*

heaping.py: build and update the heap

testing.py: calculates accuracy

3- Data Sets:
breast.cancer.txt
census.txt
galaxySurveyDataSet.txt
synthetic data sets: 16 different multi variate gaussian data sets 