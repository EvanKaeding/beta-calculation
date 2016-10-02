##This function is designed to pull down historical stock return
##information from Yahoo Finance's API. The function takes the number
##of years requested, the frequency of reporting and the ticker as arguments, 
##downloads a csv and returns the contents of the csv as a data.frame

get_hist_data <- function(years, tkr, freq, save){
  
  ##date2 represents the date the URL API form
  
  today <- Sys.Date()
  
  date2 <- paste("&d=", format(today, '%m'), "&e=", format(today, '%d'), "&f=", format(today, '%Y'), sep='')
  
  
  ##date1 represents the date in the URL API form
  
  start <- today - years * 365
  
  date1 <- paste("&a=", format(start, '%m'), "&b=", format(start, '%d'), "&c=", format(start, '%Y'), sep='')
  
  ##Frequency dictates whether the API will give daily, weekly, monthly or
  ##dividend only data. d = daily, w = weekly, m = monthly , v = dividends only
  
  frequency <- paste("&g=", freq, sep='')
  
  
  ##Start Building the URL
  
  domain_path <- "http://real-chart.finance.yahoo.com/table.csv?s="
  
  tail <- "&ignore=.csv"
  
  ##Combine all of the parts into the link
  
  link <- paste(domain_path, tkr, date1, date2, frequency, tail, sep='')
  
  ##Construct the filename for downloading the data so it reads: "[ticker]-[frequency].csv"
  
  filename <- paste(tkr, "-", freq, ".csv", sep='')
  
  ##Download the file and name it
  
  download.file(link, filename)
  
  ##Return a data.frame that has the stock history
                            
  data.frame(read.csv(filename))
  
  ##If the user has made the save argument TRUE, the file won't be deleted
  
  if(save==FALSE){
    
    file.remove(filename)
    
    }
  
}