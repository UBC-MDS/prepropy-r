
# prepropyr

<!-- badges: start -->
[![R-CMD-check](https://github.com/UBC-MDS/prepropy-r/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/prepropy-r/actions)
[![codecov](https://codecov.io/gh/UBC-MDS/prepropy-r/branch/main/graph/badge.svg?token=ZGC19OTEOD)](https://codecov.io/gh/UBC-MDS/prepropy-r)
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

## Usage

`eda()` 

The eda() function helps to quickly explore the data by showing a pairplot and some summary statistics for a given dataframe .

``` r
library(prepropyr)

df <- data.frame(num1 = c(8.5, 8, 9.2, 9.1, 9.4),
                  num2 = c(0.88, 0.93, 0.95 , 0.92 , 0.91),
                  num3 = c(0.46, 0.78, 0.66, 0.69, 0.52),
                  num4 = c(0.082, 0.078, 0.082, 0.085, 0.066),
                  cat1 = c("Good","Okay","Excellent","Terrible","Good"),
                  target = c(2,2,3,1,3)
```
After calling the eda() function, we can get following outputs,see the docstring for more available outputs.

``` r
result <- eda(df,"target")
result$nb_num_features
```

``` r
4
```

`imputation()`

The imputation() function will impute missing data in a tibble/dataframe given the chosen method(mean, median)

``` r
test_df <- data.frame('a' = c(1,NA,3), 'b' = c(5,6,NA), 'c' = c(NA,1,10))
test_df_imputed <- imputation(test_df, test_df, 'mean')
```

`scaler()`

This function scales numerical features based on scaling requirement(standardization, minmax Scaling) in a data.frame

``` r
X_train <- data.frame('a' = c(1,2,3), 'b' = c(5,6,3), 'c' = c(2,1,10))
X_test <- data.frame('a' = c(1,5,3), 'b' = c(5,6,5), 'c' = c(2,5,10))
X_Valid <- data.frame('a' = c(5,5,3), 'b' = c(5,6,5), 'c' = c(2,5,10))
scaled_df <- scaler(X_train, X_Valid, X_test, scaler_type='standardization')
```

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

