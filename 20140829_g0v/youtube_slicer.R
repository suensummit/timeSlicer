rm(list = ls())
# install.packages('stringr')
library(stringr)

## load data
youtube_list <- read.table('youtube_list_test.csv', sep = ',', skip = 4)

## data cleaning
names(youtube_list) <- c('url', 'duration')
youtube_list$url <- as.character(youtube_list$url)
youtube_list$duration <- as.character(youtube_list$duration)
ind <- grep(x = youtube_list$url, pattern = '*youtube*')
youtube_list <- youtube_list[ind,]
ind <- grep(x = youtube_list$duration, pattern = '^\\d{2}:\\d{2}:\\d{2}$')
youtube_list <- youtube_list[ind,]

## youtube api
for (i in 1:length(youtube_list$url)) {
  youtube_list$url[i] <- str_replace(string = youtube_list$url[i], pattern = "watch[[:punct:]]v[[:punct:]]", replacement = 'v/')
}

## transfer video duration in seconds
temp = c(0)
for (i in 1:length(youtube_list$duration)) {
  temp[i] <- as.numeric(strsplit(youtube_list$duration[i], split=':')[[1]]) %*% c(3600, 60, 1)
}
youtube_list <- cbind(youtube_list, as.numeric(temp))
names(youtube_list)[3] <- 'sec'

## split into several 3 minutes, 30 seconds overlay short clips
div <- 3
overlay <- 30
fileConn <- file("output3.txt", open = 'w+')
for (j in 1:length(youtube_list$sec)) {
  ndiv <- ceiling(youtube_list$sec[j] / (div*60))
  for (i in 1:ndiv) {
    start <- (i - 1)*(div*60 - overlay)
    end <- start + div*60
    writeLines((paste0(youtube_list$url[j], "?start=", start, "&end=", end)), fileConn)
  }
}
close(fileConn)

## and we've got an "output.txt" text file with those urls!
