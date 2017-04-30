


# -------------------------------------------------------------------------------------------------------- 
# 
#
#
#   Author          :    Youssef Sbai Idrissi
#   Maintainer      :    Youssef Sbai Idrissi
#   Github          :    https://github.com/postwittgenstein
#   Description     :    This is the DIANA Algorithm, or called Divisive Analysis Algorithm. Used for clustering. i prefered to let it open than to wrap 
#                        it into a package. You're free to use it and to share it. Enjoy !
#   Specification   :    The data in your data set should be set in the orde below :
#                         
#                           A1        A2        ...       An
#                           1         0         ...       0
#                           0         0         ...       1
#                         
#                        All we need is a data set in the order above, then the algorithm classify it. Creating groups depending on the nGroups numbers
#                        you've specified.
#
#   
#   NOTE            :    This page is set as an example of use.
#                        1 ) Import the source as : 
#                            > source("./DIANA_Launch.R)
#                        2 ) Call the function, by giving in agument the source of Data to analyse :
#                            > DIANA( path = "./H_Clustering_Data_Sample.xlsx", nGroups = 3)
#
#
#   Data Sample     :    If you've extracted the file from my git source, you'll find a set of 
#                        sample data we've used in the class of DataMining. Here is the path : 
#                        
#                         "./H_Clustering_Data_Sample.xlsx"
#           
#
#
#
# -------------------------------------------------------------------------------------------------------- 



source("./DIANA_Launch.R")

DIANA(path = "./H_Clustering_Data_Sample.xlsx", nGroups = 3)


