
  ## Cache Matrix
  makeCacheMatrix <- function(x = matrix()) {
    
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    ## inverse function
    setinv <- function(inverse) inv <<- inverse
    ##getting the inverse function
    getinv <- function() inv
    list(set = set, get = get, setinv = setinv, getinv = getinv)
  }



cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached result")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
