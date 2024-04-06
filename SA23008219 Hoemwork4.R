install.packages("caret")
install.packages("randomForest")
library(caret)
library(randomForest)# 安装和加载"caret""randomForest"包

data <- mtcars# 加载数据集

missing_values <- sum(is.na(mtcars))# 数据预处理 检查是否有缺失值
if (missing_values > 0) {
  cat("数据集中存在缺失值，缺失值数量为:", missing_values, "\n")
} else {
  cat("数据集中没有缺失值。\n")
}

features <- setdiff(names(data), "mpg")# 特征选择和可视化 将所有列（除了mpg以外）都作为特征进行选择

control <- trainControl(method="cv", number=5) 
set.seed(123)  # 模型训练和调优
model <- train(mpg ~ ., data=data, method="rf", trControl=control, tuneLength=3)# 模型评估
print(model)  # 模型详细信息
plot(model)   # 可视化模型
predictions <- predict(model, newdata=data)
rmse <- RMSE(predictions, data$mpg)
r_squared <- R2(predictions, data$mpg)
# 评估模型性能
cat("RMSE:", rmse, "\n")
cat("R-squared:", r_squared, "\n")
# 模型的性能指标