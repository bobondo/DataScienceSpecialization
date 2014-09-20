## makeCacheMatrix function creates a special "matrix" object that 
## can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    inverse.matrix <- NULL
    
    # set the value of the input matrix 
    
    set <- function(y) {
        x <<- y
        inverse.matrix <<- NULL
    }
    
   
    # get the value of the input matrix
    get <- function() x
    
    # setting the value of the inverse matrix
    setinverse <- function(inverse) inverse.matrix <<- inverse
    
    # get the value of the inverse matrix
    getinverse <- function() inverse.matrix
    
    # list all functions
    list(set = set, 
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
    
}


## cacheSolve function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
## Computing the inverse of a square matrix can be done with the 
## solve function in R. 

cacheSolve <- function(x, ...) {
    inverse.matrix <- x$getinverse()
    
    # Checking for cached inverse matrix
    
    if(!is.null(inverse.matrix)) {
        message("Getting cached inverse matrix")
        return(inverse.matrix)
    }
    # Creating inverse matrix in the event that
    # there's no cached matrix available
    
    newmatrix <- x$get()
    inverse.matrix <- inverse(newmatrix, ...)
    x$setinverse(inverse.matrix)
    
    # return value of inverse matrix
    
    inverse.matrix
    
}