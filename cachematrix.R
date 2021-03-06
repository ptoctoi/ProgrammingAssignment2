## Put comments here that give an overall description of what your
## functions do: write a pair of functions that cache the inverse of a matrix.

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinver <- function(solve) m <<- solve
  getinver <- function() m
  list(set = set, get = get,
       setinver = setinver,
       getinver = getinver)
  
}


## Write a short comment describing this function
## This function computes the inverse of the special 
##"matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinver()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinver(m)
  m
  
  }
