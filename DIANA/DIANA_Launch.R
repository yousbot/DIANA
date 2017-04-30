
# Launch the test from here 
# NB : Make sure you've deleted all the previous CSV Files 
# NB : We will need only your data sheet

library(XLConnect)
library(XLConnectJars)
library(xlsx)
library(openxlsx)

DIANA <- function(path, nGroups)
{
  
  assign('data', read.xlsx(path), envir = .GlobalEnv)
  assign('k', nGroups-1, envir = .GlobalEnv)
  source("./DIANA_Core.R")
  
  cat("\n\n\n")
  cat("NOTE  : ","\n\n") 
  cat("1. Access your initial data       : data ","\n")
  cat("2. Access the similarity matrix   : df ","\n")
  cat("3. Access the groups              : general_list ", "\n\n\n\n")

  
  
}

