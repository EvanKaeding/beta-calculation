##Function that takes in two data frames that are produced by Yahoo Finance
##historical stock data, for the purposes of calculating the beta.
##Typically beta is calculated using percentage historical returns
##measured against some kind of index.

calculate_beta <- function(stock, index){

  #Computes the change in the daily price as a percentage
  
	stock_ret <- (stock$Adj.Close - stock$Adj.Close[-1])/stock$Adj.Close[-1]
  
	index_ret <- (index$Adj.Close - index$Adj.Close[-1])/index$Adj.Close[-1]
  
  #Consistently getting a weird number at the end of the vector. This
  #operation chops it off at the end
  
  length(stock_ret) <- length(stock_ret) - 1
  
	length(index_ret) <- length(index_ret) - 1
  
  #Beta calculation
  
  beta <- cov(stock_ret, index_ret)/var(index_ret)
  
  beta
  
}
	