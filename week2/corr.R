corr <- function(directory, threshold = 0) {
    comp_tbl <- complete(directory)
    cr <- c()
    for (i in comp_tbl$id[comp_tbl['nobs'] > threshold]) {
        fname = sprintf('%03d.csv', i)
        fpath = file.path(directory, fname)
        tmpdata <- read.csv(fpath, header=T, sep=',')
        sulfate <- tmpdata$sulfate[complete.cases(tmpdata)]
        nitrate <- tmpdata$nitrate[complete.cases(tmpdata)]
        tmpval <- cor(sulfate, nitrate)
        if (!is.na(tmpval)) {
            cr <- c(cr, tmpval)
        }
    }
    cr
}
