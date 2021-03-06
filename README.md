
# prepropyr

<!-- badges: start -->
<!-- badges: end -->

A R package for data preprocessing 

## Overview

Data preprocessing and EDA are essential to any data science project. EDA provides insights into a dataset , visualizes and interprets the information that is hidden in the dataset. Data preprocessing is crucial to get scale features to train better models and handle missing values. In the real world, datasets contain a large number of features and observations and it is unrealistic to expect that raw dataset is perfect and ready for model building. The package aims to facilitate users to perform data imputation, feature scaling and basic exploratory data analysis for machine learning modeling.


## Features

The package is under development, it will includes the following functions:

- Imputer :  Identify and handle missing values in a dataframe
    - A function that will impute missing data given chosen method(mean, median, or most frequent)
    - Can work on both numerical and categorical data
- Feature Scaler:  Performs Numerical Feature Scaling 
    - Scale Numerical Features to facilitate seamless building of machine learning pipelines
    - Provide functionality to pick from multiple scaling algorithms
- EDA :  Extract info and Visualize selected features in a dataframe
    - Separate data into train/test dataset
    - Report number of missing data
    - Report feature types (numerical V.S. categorical)
    - Report class imbalance 
    - Investigate the correlation matrix

EDA and data preprocessing are crucial steps to take before diving into any machine learning models. Open-source libraries such as MICE, tidyverse, and ggplot2 provide functions to perform data scaling, data imputation, descriptive data analysis, and graphing  etc. We are not reinventing the functions but we want to integrate function across the packages and provide a quick overview of the data to users. We hope the package can speed up the data analysis process for our users.




## Installation

You can install the released version of prepropyr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("prepropyr")
```

## Contributors

|Team Members    | GitHub Username|
|---------------------|-----------|
|Chun Chieh(Jason) Chang | [jachang0628](https://github.com/jachang0628)|
|Bruhat Musunuru | [BruhatM](https://github.com/BruhatM)     |
|Pan Fan       | [pan1fan2](https://github.com/pan1fan2) |

