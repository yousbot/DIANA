library(xlsx)
library(openxlsx)

library(XLConnect)
library(XLConnectJars)
library(plyr)

options(java.parameters = "- Xmx1024m")

df <- data.frame(matrix(NA, nrow = nrow(data), ncol = 0))
name_cols <- vector()
inf <- 5

# ---------------------------------------------------------- 
# 
#         INITIALISATION OF THE MATRIX 
#
# ----------------------------------------------------------


for(i in 1:nrow(data))
{
  cols <- vector()
  
  for(j in 1:nrow(data))
  {
    Px_Up <- Px_Down <- 0
    for(p in 1:ncol(data))
    {
      if(abs(data[[p]][[j]]-data[[p]][[i]])==1)
      {
        Px_Up <- Px_Up + 1
        Px_Down <- Px_Down + 1
        
      }else{
        if(data[[p]][[j]]==1 & data[[p]][[i]]==1)
        {
          Px_Down <- Px_Down + 1
        }
      }
    }
    
    nam <- paste('E', j, sep = "")
    cols[nam] <- 1- (Px_Up/Px_Down)
  }
  
  nam <- paste('E', i, sep = "")
  name_cols <- c(name_cols, nam)
  df <- data.frame(df, cols)
  colnames(df) <- name_cols
  
}


for(i in 1:ncol(df))
{
  for(j in i:nrow(df))
  {
    df[[j]][[i]] <- inf
  }
}

# Getting the min value of the data frame 

main_index <- vector()
mindf_x <- which.min(apply(df, 1, min))
mindf_y <- which.min(df[mindf_x[[1]],])

main_index <- c(main_index, mindf_x)
main_index <- c(main_index, mindf_y)

main_index <- min(main_index)



# ----------------------------------------------------------------
#
#                     ALGORITHM DIANA 
#
# ----------------------------------------------------------------

  Cluster <- list()
  Cl <- vector
  C_c <- vector()
  Cluster <- append(Cluster, list(names(df)))
  cnt <- sapply(Cluster, length)
  Cl <- Cluster[which.max(cnt)]

for(p__ in 1:k)
{
  

 if(p__ != 1 )
 {  
   cnt <- sapply(Cluster[[p__]], length)
   Cl <- Cluster[[p__]][which.max(cnt)]
 }
  
ArgMin <- list()

for( i in 1:length(Cl[[1]]) )
{ 
  t <- 0

  for(j in 1:nrow(df))
  {
    if( df[[i]][[j]] != 5 & i != j)
    {
      t <- t +  df[[i]][[j]]
      
    }else{
      if( df[[j]][[i]] != 5 & i != j)
      {
        t <- t +  df[[j]][[i]]
      }
    }
    
  }
  
  ArgMin <- append(ArgMin, t/(length(Cl[[1]])-1))
}
pp <- length(Cl[[1]])-1
x <- Cl[[1]][which.min(ArgMin)]
C_c <- append(C_c, x)
Cl <- Cl[[1]][-which.min(ArgMin)]


Si <- list()
p <- 0

for(j in 1:length(C_c))
{
  for(i in 1:length(Cl))
  { 
    i_index <- which(names(df)==Cl[[i]])
    tPlus <- 0
    tMinus <- 0
    t <- 0
    for(p in 1:nrow(df))
    {
      
      if( df[[i_index]][[p]] != 5 & i != p & !isTRUE(names(df[p]) ==  C_c ) )
      {
        tPlus <- tPlus +  df[[i_index]][[p]] 
        
      }else{
        if( df[[p]][[i_index]] != 5 & i != p & !isTRUE(names(df[p]) ==  C_c ))
        {
          tPlus <- tPlus +  df[[p]][[i_index]]
          
        }else{
          if(isTRUE(names(df[p]) ==  C_c ) & i != j & df[[i_index]][[p]] != 5)
          {
            tMinus <- tMinus + df[[i_index]][[p]]
          }
       }
      }
    }
    
    t <- tPlus/(length(Cl)-1) - tMinus/length(C_c)
    
    if( t < 0 )
    {
      C_c <- append(C_c, Cl[[i]] ) 
      Cl <- Cl[-i]
      p <- p + 1
    }
  }
}


t_p <- list()
t_p <- append(t_p, list(Cl))
t_p <- append(t_p, list(C_c))

Cluster <- append(Cluster, list(t_p))

Cl <- vector()
C_c <- vector()

}

  
general_list <- list()  


for(i in 2:length(Cluster))
{
  general_list <- append(general_list, list(Cluster[[i]][[2]]))
}

general_list <- append(general_list, list(Cluster[[i]][[1]]))
  
  
  