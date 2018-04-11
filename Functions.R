### Create a function that adds two nos

add <- function(x,y){
  if(!is.numeric(x) || !is.numeric(y)){
    return("Numbers are not numeric")
  }
  return(x+y)
}

add(1,2)
add("a", 2)

#### Create a function call it above10(), which takes a vector of numbers and returns only the numbers above 10

vec = c(3,15,17,5,20,2)

above10 <- function(x){
  x[x>10]
}

above10(vec)
