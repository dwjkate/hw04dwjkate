#' Recursive Sequence
#'
#' @param x Vector containing three numeric elements
#' @param n Number of elements of the sequence
#'
#' @return nth element of the sequence
#' @export
#'
#' @examples myseq_n(x = c(2, 4, 3), n = 7)
myseq_n <- function(x, n) {
  if (length(x) == 3 && is.numeric(x) && n > 0){
    myseq_vec <- vector(mode = "double", length = n)
    for(i in seq_along(myseq_vec)) {
      if (i <= 3){
        myseq_vec[[i]] = x[[i]]
      } else if (i > 3 && i <= n){
        myseq_vec[[i]] = myseq_vec[[i - 1]] + ((myseq_vec[[i - 3]] - myseq_vec[[i - 2]]) / i)
      } else if (i > n){
        stop()
      }
    }
  }
  else{
    stop(print("Error: Check Your Input."))
  }
  return(myseq_vec[[n]])
}

