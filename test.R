# This function is built to test out the behaviour of the cacheMatrix functions.
# For that, it creates a matrix of 1000 rows and 1000 columns filled with normal
# random numbers, and subsequently, it prints out the runtime of both calls to
# calculate its inverse matrix. The first run is expected to take a longer time
# than the second one because it actually calculates the inverse matrix while the 
# second run only retrieves the result from the cache.

test = function(){
      
      set.seed(1234567)
      r = rnorm(1000000)
      m = matrix(r, nrow=1000, ncol=1000)
      
      temp = makeCacheMatrix(m)
      start.time = Sys.time()
      inv = cacheSolve(temp)
      dur = Sys.time() - start.time
      print(paste("Time elapsed with computing:", dur, "secs", sep=" "))
      
      start.time = Sys.time()
      inv = cacheSolve(temp)
      dur = Sys.time() - start.time
      print(paste("Time elapsed with cache:", dur, "secs", sep=" "))
}

# Results:
# > test()
# [1] "Time elapsed with computing: 4.22624087333679 secs"
# Getting cached data
# [1] "Time elapsed with cache: 0.00100016593933105 secs"

## It shows that computation time has been reduced by over 99,9998% !!
