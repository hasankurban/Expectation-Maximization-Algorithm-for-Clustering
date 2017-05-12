# MVN Data Generator

Generating high dimensional MVN data.

## Usage:

1. source(?MVN-data-generator.R?)

2. mix.MVN.data.generator(n,d,k,mu1)

     * n: number of data points, d: #of dimensions, k = number of Gaussians  (clusters)

     * mu1: vector of means for one dimension data, for example, for 3 Gaussians  mu1= c(1,3,5)

     * Note that covariance matrix is predefined, but it can be changed in the function. Covariances are randomly selected from [0.01,0.04] and variances are assigned, the smallest one being 0.1 and the proportion of the largest one to the  smallest being 10.
     
## FILES:

* mvnGenerator.R : Implementation of MVN data generator
* exampleInput.R: An examle that shows how to choose the parameters.
* output.R : Sampling, Normalizing, Plotting  the synthetic data setS

