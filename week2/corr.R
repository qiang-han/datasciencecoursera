corr <- function(directory, threshold = 0) {
    calcdata <- data.frame()
    for (i in 1:length(id)) {
        fname = sprintf('%03d.csv', id[i])
        fpath = file.path(directory, fname)
        tmpdata <- read.csv(fpath, header=T, sep=',')
        calcdata[i, 1] <- id[i]
        calcdata[i, 2] <- sum(complete.cases(tmpdata))
    }
    colnames(calcdata) <- c('id', 'nobs')
    print(calcdata)
}
