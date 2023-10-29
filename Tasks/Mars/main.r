
input_data_1 <- read.table("data/my34_clear.txt", header=TRUE, sep = " ", dec = ".")
input_data_2 <- read.table("data/my35_clear.txt", header=TRUE, sep = " ", dec = ".")

input_data_1 <- subset(input_data_1, select = c("dust_opac", "ice_opac"))
input_data_2 <- subset(input_data_2, select = c("dust_opac", "ice_opac"))

input_data <- rbind(input_data_1, input_data_2)
attach(input_data)

sep <- rbinom(nrow(input_data), 1, 0.80)

learning_data  <- input_data[sep == 1,]
valid_data <- input_data[sep == 0,]

model = lm(ice_opac ~ I(1/dust_opac), data=learning_data)

predict_result <- predict(model, newdata = valid_data, type="response")


plot(valid_data$dust_opac, predict_result)

print("ok")
