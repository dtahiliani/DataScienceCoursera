complete <- function(directory, id = 1:332) {

  nobs = numeric()
 
  for (i in id) {
    path<-paste(directory, "/", sprintf("%03d", i), ".csv", sep='')
    
    readData = read.csv(path)
    
    nobs <- c(nobs, sum(complete.cases(readData)))
    ##print(nobs)
  }
  return(data.frame(id, nobs))
}