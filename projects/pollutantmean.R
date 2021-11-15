pollutantmean <- function(directory, pollutant, id = 1:332) {
  fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  values <- numeric()
  
  for (i in id) {
    data <- read.csv(fileList[i])
    values <- c(values, data[[pollutant]])
  }
  mean(values, na.rm = TRUE)
}

## testing
## source("pollutantmean.R")
## pollutantmean("specdata", "sulfate", 1:10)
## pollutantmean("specdata", "nitrate", 70:72)
## pollutantmean("specdata", "nitrate", 23)