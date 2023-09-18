
task_2 <- function() {
    side_1 <- 3
    side_2 <- 5
    len <- side_1 * side_2
    return(len)
}

task_5 <- function() {
    season <- c(rep("winter",2), rep("spring",3), rep("summer",3), rep("autumn",3), "winter")
    return(season)
}


task_8 <- function() {
    powers_of_two <- c()
    for(i in 1:5) {
        powers_of_two <- c(powers_of_two, 2^i)
    }
    return(powers_of_two)
}

print(task_8())