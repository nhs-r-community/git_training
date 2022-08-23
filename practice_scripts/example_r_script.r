# contains example r script

# install tidyverse, NHSRdatasets and run
install.packages(c("tidyverse", "NHSRdatasets"))
library(tidyverse)
library(NHSRdatasets)

# assing a string to a variable
myString <- "Hi, I'm using version control!"

# print the variable
print(myString)

# bar chart for different types of diamonds and levels of clarity using the diamonds dataset
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
    )

# create a function that prints out the number of missing values in a dataframe
display_missing <- function(df) {
  n <- sum(is.na(df))
  cat("Missing values: ", n, "\n", sep = "")
  
  return(invisible(df))
  }

# count missing values for ONS Mortality dataset from the NHSRdatasets package
display_missing(ons_mortality) # result is 197
