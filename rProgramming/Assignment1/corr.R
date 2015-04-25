corr <- function(directory, threshold=0){
  
  frame1 = complete(directory)
  idset = frame1[frame1["nobs"] > threshold, ]$id
  corrframe = numeric()
  
  for(i in idset) {
    readframe = read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep=''))
    
    frame2 = readframe[complete.cases(readframe), ]
    corrframe = c(corrframe, cor(frame2$sulfate, frame2$nitrate))
  }
  return(corrframe)
}


