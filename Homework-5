
## Purpose:如何将内置数据集Doubs的数据上传到PostgreSQL或SQLite中
##
## Author: Pengcheng Xiong
## 
## Emai: esteldarwin@mail.ustc.edu.cn
# PostgreSQL数据库
library(ade4)
library(reticulate)
library(DBI)
library(RPostgres)

data(doubs)
fish <- doubs$fish
env <- doubs$env
complete_data <- na.omit(cbind(fish, env))


con <- dbConnect(RPostgres::Postgres(),
                 dbname = "post",
                 host = "local",
                 port = "666",
                 user = "post",
                 password = "777")


dbWriteTable(con, "doubs", doubs, overwrite = TRUE)

dbDisconnect(con)


# SQLite数据库

data(doubs)

con <- DBI::dbConnect(RSQLite::SQLite(), dbname = db_file)

dbWriteTable(con, "Doubs", complete_data, row.names = FALSE)

dbDisconnect(con)
