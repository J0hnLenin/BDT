task_1 <- function() {
  width <- 2
  len <- width + 7
  per <- len + len + width + width
  return(per)
}

task_4 <- function() {
  return(c(-3, -2, -1))
}

task_6 <- function() {
  month <- c("January", "February", "March", "April", "May", "June", "JUly", "August", "September", "October", "November", "December")
  return(month)
}

task_7 <- function() {
  month <- task_6()
  return(c(month[0:3], month[6:9]))
}

task_9 <- function(){
  month <- task_6()
  calendar <- matrix(month, byrow = TRUE, nrow = 4, ncol = 3)  
  return(calendar)

}

print(task_9())