# install.packages("ROCR", dependencies = TRUE, repos = "http://cran.us.r-project.org")
# install.packages("httpgd", dependencies = TRUE, repos = "http://cran.us.r-project.org")
# install.packages("devtools", dependencies = TRUE, repos = "http://cran.us.r-project.org")
# devtools::install_github("nx10/httpgd")
# install.packages("languageserver", dependencies = TRUE, repos = "http://cran.us.r-project.org")

library("ROCR")

input_data <- read.csv2("Credit.csv", header = TRUE, sep=';')
colnames(input_data) <- c("credit", "class", "salary", "age", "credit_card")

sep <- rbinom(nrow(input_data), 1, 0.90)

learning_data  <- input_data[sep == 1,]
valid_data <- input_data[sep == 0,]

model = glm(credit ~ salary + age, data=learning_data, family = binomial)

predict_result <- predict(model, newdata = valid_data, type="response")

pred = prediction(predict_result, valid_data$credit)
perf_tpr_fpr = performance(pred, "tpr", "fpr")

perf_acc = performance(pred, "acc",)

acc <- max(perf_acc@y.values[[1]])
print(acc)

plot(perf_tpr_fpr, colorize=TRUE, print.cutoffs.at=seq(0,1,0.1), text.adj=c(-0.2,1.7))

threshold_level <- 0.7
TP <- sum(valid_data[predict_result >= threshold_level & valid_data$credit == 1,])
FP <- sum(valid_data[predict_result >= threshold_level & valid_data$credit == 0,])
TN <- sum(valid_data[predict_result < threshold_level & valid_data$credit == 0,])
FN <- sum(valid_data[predict_result < threshold_level & valid_data$credit == 1,])
N <- sum(valid_data)

acc <- (TP + TN) / N
print(acc)


