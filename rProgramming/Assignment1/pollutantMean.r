pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of
  ## the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating the name of the
  ## pollutant for which we will calculate the mean; either 'sulfate' or
  ## 'nitrate'.
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return the mean of the pollutant across all monitors list in the 'id'
  ## vector (ignoring NA values)
  
  
  myData = numeric()
  for (i in id) {
    ##define the individual path
    path<-paste(directory, "/", sprintf("%03d", id[i]), ".csv", sep='')
    
    ##Reading in the data foro i
    readData = read.csv(path)
    
    ##Creating a new table
    myData = c(myData, readData[[pollutant]])
    }
  ## Calculate and return the mean
  return(mean(myData, na.rm = TRUE))
}