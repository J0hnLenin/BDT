


#install.packages("ROCR", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#install.packages("httpgd", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#install.packages("devtools", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#devtools::install_github("nx10/httpgd")
#install.packages("languageserver", dependencies = TRUE, repos = "http://cran.us.r-project.org")
library("ROCR")

input_data <- read.csv2("Credit.csv", header = TRUE, sep=';')
colnames(input_data) <- c("credit", "class", "salary", "age", "credit_card")

sep <- rbinom(nrow(input_data), 1, 0.90)

learning_data  <- input_data[sep == 1,]
valid_data <- input_data[sep == 0,]

model = glm(credit ~ salary + age, data=learning_data, family = binomial)

predict_result <- predict(model, newdata = valid_data, type="response")

ROCRpred = prediction(predict_result, valid_data$credit)
ROCRperf = performance(ROCRpred, "tpr", "fpr")

plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,0.1), text.adj=c(-0.2,1.7))

