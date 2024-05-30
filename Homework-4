
#Author: Pengcheng Xiong


#Email:esteldarwin@mail.ustc.edu.cn


#Description:主要关于如何使用caret进行模型构建等

library(caret)
library(randomForest)
library(ggplot2)

#加载数据并定义包含mtcars数据集的数据框,查看数据结构特征
data(mtcars)   
df <- mtcars   
str(df)
head(df)


sum(is.na(mtcars))

sum(is.na(mpg))

# 数据测试与训练
set.seed(123)
trainIndex <- createDataPartition(mtcars$mpg, p = 0.8, list = FALSE)
trainData <- mtcars[trainIndex, ]
testData <- mtcars[-trainIndex, ]


# 随机森林模型
model <- train(
  mpg ~ .,
  data = trainData,
  method = "rf",
  trControl = trainControl(method = "cv"),
  tuneLength = 3
)

print(model)

# 评估模型效果
predictions <- predict(model, testData)
rmse <- RMSE(predictions, testData$mpg)
r_squared <- R2(predictions, testData$mpg)

cat("RMSE: ", rmse, "\n")
cat("R-squared: ", r_squared, "\n")

ggplot(data = testData, aes(x = mpg, y = predictions)) +
  geom_point() +
  geom_abline(color = "purple") +
  labs(x = "Actual MPG", y = "Predicted MPG", title = "Actual vs. Predicted MPG")


varImp(model)
summary(model)
