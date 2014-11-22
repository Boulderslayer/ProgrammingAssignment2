## Put comments here that give an overall description of what your
## functions do

## Cache the value of an inverted matrix for later use

makeCacheMatrix <- function(x = matrix()) {

	m<-NULL
	set <-function(y){
		x<<-y
		m<<-NULL
	}
	get<-function() x
	set_inverse <- function(m_inv) m<<-m_inv
	get_inverse <- function() m
	list(set=set,get=get,set_inverse=set_inverse,get_inverse=get_inverse)
}


## Will check the cache to see if the inverse is already there, 
## else will take the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m<-x$get_inverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data<-x$get()
	m<-solve(data)
	x$set_inverse(m)
	m
}
