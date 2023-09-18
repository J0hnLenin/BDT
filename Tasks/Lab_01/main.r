task_1 <- function() {
  width <- 2
  len <- width + 7
  per <- len + len + width + width
  return(per)
}

task_2 <- function() {
  side_1 <- 3
  side_2 <- 5
  len <- side_1 * side_2
  return(len)
}

task_3 <- function () {
  print(root<- 27^(1/3))
}

task_4 <- function() {
  return(c(-3, -2, -1))
}

task_5 <- function() {

  season <- c(rep("winter",2), rep("spring",3), rep("summer",3), rep("autumn",3), "winter")
  return(season)
}

task_6 <- function() {
  month <- c("January", "February", "March", "April", "May", "June", "JUly", "August", "September", "October", "November", "December")
  return(month)
}

task_7 <- function() {
  month <- task_6()
  return(c(month[0:3], month[6:9]))
}

task_8 <- function() {
    powers_of_two <- c()
    for(i in 1:5) {
        powers_of_two <- c(powers_of_two, 2^i)
    }
    return(powers_of_two)
}

task_9 <- function(){

  month <- task_6()
  calendar <- matrix(month, byrow = TRUE, nrow = 4, ncol = 3)  
  return(calendar)
}

task_10 <- function(){
  calendar <- task_9()
  return(calendar[3,])
}

task_11 <- function() {
  return(task_9()[2,3])
}

task_13 <- function() {
  season_f <- factor(task_5(), levels = c("winter", "spring", "summer", "autumn"))
  return(season_f)
}

task_14 <- function() {
  season <- task_5()
  season_f <- factor(season, levels = c("winter", "spring", "summer", "autumn"))
  levels(season_f) <- c("wi", "sp", "su", "au")
  return(season_f)
}

task_15 <- function() {
  season <- task_5()
  season <- season != "winter"
  return(season)
}

print(task_15())


#test comment 