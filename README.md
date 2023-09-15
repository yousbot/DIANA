# DIANA: Divisive Analysis Clustering Algorithms

![Archived](https://img.shields.io/badge/Status-Archived-red)

Clustering algorithms are a set of computational methods designed to classify data into different groups based on similarity metrics. The DIANA package is one such algorithm that facilitates this task.

## Table of Contents
- [Steps of Use](#steps-of-use)
- [Usage Example](#usage-example)
- [Infos about the Package](#infos-about-the-package)

---
## Steps of Use

1. **Extract the Package**:  
   Unzip and place the package in the root directory of your current project.

2. **Include the Package in Your Code**:  
   Use the following line to source the package into your R script.  
   ```R
   source("./DIANA_Launch.R")
   ```
Run the Functions:
You can now call the functions within your code. Note that these functions do not return any values but populate global variables instead. Check the note that appears for more details.

## Usage Example
To call the function, use the following syntax:
```R
DIANA(path = "./H_Clustering_Data_Sample.xlsx", nGroups = 3)
```

Infos about the Package
Author: Youssef Sbai Idrissi
Maintainer: Youssef Sbai Idrissi
Date: 30 April 2017
Version: 0.1.0
