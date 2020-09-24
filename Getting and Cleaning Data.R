#Lesson 1: Manipulating Data with dplyr
mydf <- read.csv(path2csv,stringsAsFactors = FALSE)
dim(mydf);head(mydf)
library(dplyr)
cran <- tbl_df(mydf)
rm("mydf")
#select选择列
select(cran, ip_id, package, country)#选择指定列
select(cran, r_arch:country)#选择x到y列，也可以反过来选
select(cran, -time)#去掉不要的列
select(cran,-(X:size))#去掉不要的连续列
#选择行
filter(cran, package == "swirl")
filter(cran, r_version == "3.1.1", country == "US")
?Comparison
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran,size > 100500, r_os == "linux-gnu")
is.na(c(3, 5, NA, 10))#判断缺失值
!is.na(c(3, 5, NA, 10))
filter(cran, !is.na(r_version))
cran2 <- select(cran, size:ip_id)#select() all columns from size through ip_id and store the result in cran2
#arrange排序
arrange(cran2, ip_id)#按ip_id 升序排列ascending
arrange(cran2, desc(ip_id))#升序排列
arrange(cran2, package, ip_id)#先按package字母顺序排列，再按ip_id排列
arrange(cran2, country, desc(r_version),ip_id)
cran3 <- select(cran, ip_id, package, size)
#mutate 创造列
mutate(cran3, size_mb = size / 2^20)#add a column called size_mb that contains the download size in megabytes
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3,correct_size = size+1000)
#summarize
summarize(cran, avg_bytes = mean(size))

#Lesson 2: Grouping and Chaining with dplyr
cran <- tbl_df(mydf)
rm("mydf")#remove the original dataframe
cran
?group_by
by_package <- group_by(cran, package)#按包名分组
by_package
summarize(by_package,mean(size))
quantile(pack_sum$count, probs = 0.99)#看前百分之一分位数
top_counts <- filter(pack_sum, count > 679)#筛选出前百分之一
top_counts_sorted <- arrange(top_counts, desc(count))#按下载数降序排列
quantile(pack_sum$unique, probs = 0.99)#查看unique的前百分之一
top_unique <- filter(pack_sum, unique > 465)
top_unique_sorted <- arrange(top_unique, desc(unique))
#后面教了管道操作符
#Lesson 3: Tidying Data with tidyr
library(tidyr)
students


#Lesson 4: Dates and Times with lubridate