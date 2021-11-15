corr <- function(directory, threshold = 0) {
  fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  df <- complete(directory)
  ids <- df[df["nobs"] > threshold, ]$id
  corrr <- numeric()
  for(i in ids) {
    data <- read.csv(fileList[i])
    dff <- data[complete.cases(data), ]
    corrr <- c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}

## testing
## source("corr.R")
## source("complete.R")
## cr <- corr("specdata", 150)
## head(cr)
## summary(cr)
## cr <- corr("specdata", 400)
## head(cr)
## summary(cr)
## cr <- corr("specdata", 5000)
## summary(cr)
## length(cr)
## cr <- corr("specdata")
## summary(cr)
## length(cr)