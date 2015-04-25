readreadData <- function(directory, id){
  read.csv(paste(directory, "/", sprintf("%03d", id), ".csv", sep=''))
}

readPollutantCsv <- function(directory, id) {
  read.csv(paste(directory, "/", sprintf("%03d", id), ".csv", sep=''))
}
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  source("readPollutantCsv.R")
  
  data <- NA
  
  for(i in id) {
    csv <- readPollutantCsv(directory, i)
    data <- rbind(data, csv)
  }