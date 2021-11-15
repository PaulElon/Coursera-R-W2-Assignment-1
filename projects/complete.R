complete <- function(directory, id = 1:332) {
  fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  nobs <- numeric()
  for (i in id) {
    data <- read.csv(fileList[i])
    mysum <- sum(complete.cases(data))
    nobs <- c(nobs, mysum)
  }
  data.frame(id, nobs)
}

## testing
## source("complete.R")
## complete("specdata", 1)
## complete("specdata", c(2, 4, 8, 10, 12))
## complete("specdata", 30:25)
## complete("specdata", 3)
