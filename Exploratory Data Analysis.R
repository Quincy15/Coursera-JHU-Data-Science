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

#Lesson 3 Graphics Devices in R
##when you make a plot in R, it has to be "sent" to a specific graphics device
?Devices#see what graphics devices are available on your system
#画图法一：普通方法
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.cur()#shows the current plotting device
#画图法二：发送至文档
pdf(file="myplot.pdf")
with(faithful, plot(eruptions, waiting))
#There are two basic types of file devices, 1.vector(good for line drawing) and 2.bitmap(good for plots) devices.
#1.1 pdf: good for line-type graphics and papers
#1.2 XML-based: supports animation and interactivity
#1.3 win.metafile: a windows-only metafile format
#1.4 postscript: can create encapsulated postscript files
#2.1 png( Portable network Graphic): good for line drawings or images with solid colors, also plots with many points.
#2.2 jpeg: good for photographs or natural sc3nes, not good for line drawings.
#2.3 tiff: an older lossless compression meta-format
#2.4: a native Windows bitmapped format
dev.cur()#find the current active graphics device
dev.off()#close the device
#change the active graphics device with dev.set(<integer>)
#The function dev.copy copies a plot from one device to another, and dev.copy2pdf specifically copies a plot to a PDF file.
dev.copy(png, file = "geyserplot.png")
dev.off()

#Lesson 4 Plotting Systems
#1.the Base Plotting System which comes with R(disadvantage: can't go back once a plot has started)
with(cars, plot(speed, dist))
text(x = mean(cars$speed,), y = max(cars$dist), "SWIRL rules!")
#2. the Lattice System which comes in the package of the same name.
##The lattice system is most useful for conditioning types of plots which display how y changes with x across levels of z. The variable z might be a categorical variable of your data. This system is also good for putting many plots on a screen at once.
head(state); table(state$region)#看变量有多少个值
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))
#3. ggplot2
qplot(displ, hwy, data = mpg)
#Lesson 4 
