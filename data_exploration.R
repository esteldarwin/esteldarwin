#----------------------------------------------------------------------------
#Script Name：data_exploration.R
#Author:熊鹏程
#Email:esteldarwin@mail.ustc.edu.cn
#Date:2024-4-18
#----------------------------------------------------------------------------
#1.处理Doubs数据集中的缺失数据,检测环境因素共线性
install.packages("corrplot")
install.packages("ade4")
install.packages("car")
library(corrplot)
library(tidyverse)
library(corrplot)
library(car)
library(caret)
library(ade4)# 加载所需的packages

data("doubs")# 加载Doubs数据集

doubs_clean <- na.omit(doubs)# 删除具有缺失数据的站点

str(doubs)
summary(doubs)# 查看doubs

env_cor <- cor(doubs$env[, c("dfs", "alt", "slo", "flo", "pH", "har", "pho", "nit", "amm", "oxy", "bdo")])# 计算环境因素之间的相关性

corrplot(env_cor, method="color")#绘制热图

env_data <- doubs_clean$env[, c("dfs", "alt", "slo", "flo", "pH", "har", "pho", "nit", "amm", "oxy", "bdo")]
env_data <- as.data.frame(env_data)#提取数据并定义数据框

lm_model <- lm(env_data)
vif_values <- car::vif(lm_model)
print(vif_values)#计算环境方差膨胀因子VIF以检测共线性

#2. 分析与可视化鱼类和环境之间关系
install.packages("FactoMineR")
install.packages("factoextra")
library(FactoMineR)
library(factoextra)
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

data(doubs)
env <- doubs$env
fish <- doubs$fish
fish_sum <- apply(fish, 1, sum)
fish_df <- data.frame(Site = rownames(fish), Fish_Abundance = fish_sum)
env_fi<- cbind(env, fish_df[match(rownames(env), fish_df$Site), 2])#读取数据

env_vars <- c("dfs", "alt", "slo", "flo", "pH", "har", "pho", "nit", "amm", "oxy", "bdo")
fi_var <- "Fish_Abundance"#设置变量

env_data <- env_fi[, env_vars]
fi_data <- env_fi[[fi_var]]# 提取变量

cor(env_fi[, 1:11], env_fi[, 12], method = "pearson")#检测线性关系

corr_matrix <- cor(env_fi)
corrplot(corr_matrix, method = "color")#计算并可视化相关系数矩阵

pca_result <- PCA(env_data, graph = FALSE)#进行主成分分析

pca_var <- get_pca_var(pca_result)
pca_ind <- get_pca_ind(pca_result)#提取分析结果

fviz_eig(pca_result, addlabels = TRUE)
fviz_pca_ind(pca_result, geom = "point", habillage = doubs$fish)#可视化


