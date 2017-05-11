# @Hasan Kurban, 2016, IUB, Computer Scince Department

IMPLEMENTATION OF EM-T ALGORITHM

How to run EM-T:

1- python -c 'import main; main.model_eval("dataset",k,iteration,epsilon)'

dataset: the name of the dataset. 
 
k : number of clusters

iteration: maximum number of iterations, such as 1000, 100000 e.g.,

epsilon: stopping criterion = 0.01, 0.001,0.0001 for EM-T

2- Files: 

main.py: Main file 

readingData.py: Reading and  Preprocessing data — Note that for synthetic data sets the number of attributes should be updated in the file according to the data set

EM.py: Implementation of EM-T

main.py : Main file.

readingDaa.py: Data processing  and reading Data

testing.py: calculates accuracy

3- Data Sets: 

breast.cancer.txt
census.txt
galaxySurveyDataSet.txt
synthetic data sets: 16 different multivariate gaussian data sets 
