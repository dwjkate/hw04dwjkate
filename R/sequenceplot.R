#' Sequence Plot
#'
#' @param df  A Dataframe with four columns - all numbers
#'
#' @return A plot showing the result of the myseq_n() function
#' @export
#'
#' @examples my_data <- tibble::tribble(
#' ~x, ~y, ~z, ~n,
#' 2,4,3,3,
#' 2,4,3,4,
#' 2,4,3,5,
#' 2,4,3,6,
#' 2,4,3,7,
#' 2,4,3,8,
#' 2,4,3,9,
#' 2,4,3,10,
#' 2,4,3,12)
#' seq_plot(my_data)

seq_plot <- function(df) {

# I added four different error checkings.
# 1. checking if the dataframe's values are numeric.
# 2. checking if the dataframe has at least 1 row.
# 3. checking if the dataframe has 4 columns.
# 4. checking if the names of variables are 'x,y,z and n.'

  if (all(purrr::map_lgl(df, is.numeric)) != TRUE) {
    stop("Error: Check Non-numeric value")
  } else if (nrow(df) == 0) {
    stop("Error: Check Empty dataframe")
  } else if (ncol(df) != 4) {
    stop("Error: Check Your Column.")
  } else if (any(names(df) != c("x" , "y", "z", "n"))) {
    stop("Error: Check Variable Names")
  }

# In order to create two dataframes without variable name, I used unname()
  x <- unname(df[, c("x", "y", "z")])
  n <- unname(df[, "n"])

# Initialized an empty vector to receive the result of for-loop.
  seq_plot_vec <- vector(mode = "double", length = length(n))


# Inside of the for-loop below,
# first, I used unlist() function to make dataframe 'n' to the numeric sequence
# myseq_n() function shoud take a numeric sequence and a number as its input,
# I used unlist() function to dataframe 'x' and as.double() function to 'n.'

# Then create a title, I used paste(), toString() and round() function.

# Lastly, I added a creating a plot part by using mutate() and ggplot2.

    for(i in seq_along(unlist(n))) {
      seq_plot_vec[[i]] = myseq_n(unlist(x[i, ]), as.double(n[i,]))
    }

  seq_plot_tib <- tibble::as_tibble(seq_plot_vec)

 title <- paste("My Sequence:", toString(round(seq_plot_tib, digits = 3)), sep = " ")

  seq_plot_tib %>% dplyr::mutate(n = df[, "n"]) %>%
    ggplot2::ggplot(ggplot2::aes(x = n$n, y = value)) +
    ggplot2::geom_line() +
    ggplot2::ggtitle(title) +
    ggplot2::xlab("n")+
    ggplot2::ylab("output")

}

