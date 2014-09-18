## Calculate inverse matrix and cache the result for future call

## cache inverse matrix

makeCacheMatrix <- function (x = number ()) {
  cachedata <- NULL
  setMatrix <- function(matrixdata) {
    x <<- matrixdata
    cachedata <<- NULL
  }
  getMatrix <- function() {
    x
  }
  cacheInverse <- function(solve) {
    cachedata <<- solve
  }
  getInverse <- function() {
    cachedata
  }
  list(sMatrix = setMatrix, gMatrix = getMatrix, cInverse = cacheInverse, gInverse = getInverse)
}

## Return the inverse matrix of the original maxtrix

cacheSolve <- function(y, ...) {
  inverse <- y$gInverse()
  if (!is.null(inverse)) {
    message("getting cached data")
    inverse
  }
  data <- y$gMatrix()
  inverse <- solve(data)
  y$cInverse(inverse)
  inverse
}

