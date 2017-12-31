myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

third <- function(x) {
  x - rnorm(length(x))
}

add2 <- function(x, y) {
  
    x + y
  
}

above10 <- function(x) {
  
    use <- x > 10
    x[use]
  
}

above <- function(x, n) {
  
  use <- x > n
  x[use]
}

columnean <- function(y, removeNA = TRUE) {
  
  nc <- ncol(y)
  means <- numeric(nc)
  
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  
  means
}