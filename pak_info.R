install.packages("tidyverse")
library("tidyverse")#加载包
help("tidyverse") #获得帮助文件
browseVignettes("tidyverse")  #跳转到tidyverse介绍网页
demo("tidyverse")#演示tidyverse             
apropos("^tidyverse")#展现tidyverse包含的各组分
ls("package:tidyverse")#查看包中的函数和数据集
apropos("tidy", mode = "function")#查询包中包含关键字的函数
browseVignettes(package = "tidyverse")#查看包中的Vignettes
