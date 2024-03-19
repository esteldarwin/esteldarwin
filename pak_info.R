install.packages("tidyverse")


library("tidyverse")

help("tidyverse") 

#了解tidyverse包功能的几种方式
browseVignettes("tidyverse")  
apropos("^tidyverse")         

#查看包中的函数和数据集
ls("package:tidyverse")

#查询包中包含关键字的函数
apropos("tidy", mode = "function")

#查看包中的Vignettes
browseVignettes(package = "tidyverse")