# beta-calculation
A set of functions in R that pull historical stock price data from Yahoo Finance and calculate the of the stock relative to a specified index.

##Getting started

We'll get started by sourcing both of the functions.

```rconsole
source("get_hist_data.r")
source("calculate_beta.r")
```

The first function hooks up to Yahoo Finance's API, downloads historical stock data to your working directory and returns a data.frame with that stock data. It takes three arguments as shown below:

```rconsole
get_hist_data(years, tkr, freq)
```

Where:

years <- Number of years of stock data you'd like to fetch. This is class(as.numeric)

tkr <- This is the ticker of the stock you're interested in fetching. Usually these are two to four letter strings that represent a given stock. Ex. Amazon = AMZN. This is class(as.character)

freq <- This represents the frequency of data you'd like to fetch. Yahoo Finance can return daily, weekly or monthly data. You can specify these by passing "d", "w" or "m" respectively.

Example:
```rconsole
msft <- get_hist_data(2, "MSFT", "d")
```

It's also wise to grab the historical data for a stock index as well. Remember that the beta of a stock is calculated relative to some kind of standardized index. By passing "^GSPC" as the tkr argument, you'll get data for the S&P500, a very common index used to calculate beta.

Now, let's throw these data frames into the next function. This will crunch the numbers and spit out our beta.

```rconsole
calculate_beta(stock, index)
```

Where:

stock <- The data frame returned by get_hist_data for your stock

index <- The data frame returned by get_hist_data for your index

Example:
```rconsole
beta <- calculate_beta(msft, SP500)
```
