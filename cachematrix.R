

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  
  get <- function() {x}
  
  setInverse <- function(inverse){
    inv <<- inverse
  }
  
  getInverse <- function(){
    inv
  }
  list(set=set, get=get, setInverse = setInverse, getInverse = getInverse)
  
}



cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("Getting cached data")
    return(inv)
  }
  
  matrix_data <- x$get()
  inv <- solve(matrix_data,...)
  x&setInverse(inv)
  inv
}
