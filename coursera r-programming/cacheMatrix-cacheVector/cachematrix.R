## MackeCacheMatrix and cacheSolve
## calculates and caches the inverse of a matrix
## if inverse exits, the retrive the cache
## otherwise calculate its value


## makeCacheMatrix:
## use: cache and retrieve the Inverse of a Matrix
## inputs: x a square invertible (class) matrix
## outputs: a list with getters and setters for the Matrix x and its inverse xinv
makeCacheMatrix <- function(x = matrix()) {
        xinv <- NULL ## xinv is the inverse of matrix x
        set <- function(y){ ## setter function for matrix x
                x <<- y
                xinv <<- NULL
        }
        get <- function() x   ## getter function for matrix x
        setinv <- function(inv) xinv <<- inv ## setter function for xinv
        getinv <- function() xinv ## getter function for xinv
        list(set = set, 
             get = get, 
             setinv = setinv, 
             getinv = getinv)
}


## cacheSolve:
## use:  calculates the inverse of a matrix using solve()
## inputs: x, a makeCacheMatrix class
## outputs: xinv, the inverse of x
## check if inverse with A%*%Ainv (where A is a matrix and Ainv its inverse)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        xinv <- x$getinv()
        if(!is.null(xinv)){
                message("getting cached matrix")
                return(xinv)
        }
        data <- x$get()
        xinv <- solve(data, ...)
        x$setinv(xinv)
        xinv
        
}
