# Author: Pengcheng Xiong
## Purpose of script:
1-下载control plots，并构建一个network，最后将其保存为边列表。
2-分析network属性，包括顶点和边。

# 数据下载
## 从http://129.15.40.240/mena/下载control plots数据

install.packages("igraph")
library(igraph)

#-数据读取与network构建
data <- read.table("D:\\1_shengtaixue\\Control.txt", header = TRUE, fill = TRUE)  
g <- graph_from_data_frame(data, directed = FALSE) # 创建network
write_graph(g, file = "D:\\1_shengtaixue\\network_edge_list.txt", format = "edgelist") #保存为边列表

#属性分析
cat("Number of vertices:", vcount(g), "\n")
cat("Number of edges:", ecount(g), "\n")   #顶点与边的数目

degree <- degree(g)  
print(degree)   

edge_attributes <- get.edge.attribute(g)
print(edge_attributes)
