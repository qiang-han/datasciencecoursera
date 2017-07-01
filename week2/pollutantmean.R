pollutantmean <- function(directory, pollutant, id = 1:332) {
    calcdata <- c()
    for (i in id) {
        fname = sprintf('%03d.csv', i)
        fpath = file.path(directory, fname)
        tmpdata <- read.csv(fpath, header=T, sep=',')
        calcdata <- c(calcdata, tmpdata[pollutant][!is.na(tmpdata[pollutant])])
    }
    mean(calcdata)
}
