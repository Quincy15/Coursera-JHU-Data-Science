#Lesson 1 Principles of Analytic Graphs
##Principle 1: Comparison.
##Principle 2: Show causality or a mechanism of how your theory of the data works.
##Principle 3: Multivariate（多元） data.
##Principle 4: Integrating evidence.
##Principle 5: Describe and document the evidence with sources and appropriate labels and scales.
##Principle 6: Content is King!

#Lesson 2 Exploratory Graphs
head(pollution)
summary(pollution$pm25)
#箱线图
boxplot(ppm,col = "blue")
abline(h = 12)#加一条直线
#直方图
hist(ppm,col = "green")
rug(ppm)#在x轴加了一些密度
low;high
hist(ppm, col = "green", breaks = 100)
abline(v = 12, lwd = 2)
abline(v = median(ppm),col = "magenta",lwd = 4)
names(pollution)
reg <- table(pollution$region);reg
barplot(reg, col = "wheat", main = "Number of Counties in Each Region")
boxplot(pm25~region, data = pollution, col = "red")
#plot multiple histograms in one plot,上下
par(mfrow=c(2,1),mar=c(4,4,2,1))
east <- subset(pollution,region=="east");head(east)
hist(east$pm25, col = "green")
hist(subset(pollution,region=="west")$pm25, col = "green")
with(pollution, plot(latitude, pm25))#with函数的用法
abline(h = 12, lwd = 2, lty = 2)
plot(pollution$latitude, ppm, col = pollution$region)
abline(h = 12, lwd = 2, lty = 2)
#左右
par(mfrow = c(1,2), mar = c(5,4,2,1))
west <- subset(pollution,region=="west")
plot(west$latitude,west$pm25,main = "West")
plot(east$latitude,east$pm25,main = "East")

#Lesson 3 