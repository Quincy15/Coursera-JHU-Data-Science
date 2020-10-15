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

#Lesson 5 Base Plotting System
head(airquality)
range(airquality$Ozone, na.rm = TRUE)#returns a vector containing the minimum and maximum of all the given arguments.
hist(airquality$Ozone)
table(airquality$Month)
boxplot(Ozone~Month, airquality)
boxplot(Ozone~Month, airquality, xlab = "Month", ylab = "Ozone(ppb)", col.axis = "blue", col.lab = "red", main = "Ozone and Wind in New York City")#specifying some arguments
with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in New York City")
length(par())
#The par() function is used to specify global graphics parameters that affect all plots in an R session.
par()$pin;par("fg")
plot(airquality$Wind, airquality$Ozone,type = "n")
title(main = "Wind and Ozone in NYC")
may <- subset(airquality, Month == 5)
points(may$Wind,may$Ozone,col="blue",pch=17)
notmay <- subset(airquality, Month != 5)
points(notmay$Wind,notmay$Ozone,col="red",pch=8)
legend("topright", pch = c(17,8), col = c("blue", "red"), legend = c("May", "Other Months"))#图例
abline(v=median(airquality$Wind),lty=2,lwd=2)
par(mfrow = c(1,2))
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Ozone, airquality$Solar.R, main = "Ozone and Solar Radiation")
par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Solar.R, airquality$Ozone, main = "Ozone and Solar Radiation")
plot(airquality$Temp, airquality$Ozone, main = "Ozone and Temperature")
mtext("Ozone and Weather in New York City", outer = TRUE)

#Lesson 6 Lattice Plotting System
xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")
xyplot(Ozone~Wind | as.factor(Month), data = airquality, layout = c(5,1))
#lattice graphics functions return an object of class trellis.
p <- xyplot(Ozone~Wind, data = airquality);p
p[["formula"]];p[["x.limits"]]
table(f)
xyplot(y~x|f, layout = c(2,1))
source(pathtofile("plot1.R"),local=TRUE)
myedit("plot2.R")
source(pathtofile("plot2.R"),local=TRUE)
str(diamonds)#str很好用，可以看所有变量
table(diamonds$color)
table(diamonds$color, diamonds$cut)#color是行向量名称，cut是列向量名称
myedit("myLabels.R")
source(pathtofile("myLabels.R"),local=TRUE)
xyplot(price~carat | color*cut, data = diamonds, strip = FALSE, pch = 20, xlab = myxlab, ylab = myylab, main = "mymain")

#Lesson 7 
sample(colors(),10)#The function colors() lists the names of 657 predefined colors you can use in any plotting function.
pal <- colorRamp(c("red","blue"))#interpolate colors
pal(0)#returns red;pal(1)#returns blue
pal(seq(0,1,len = 6))
p1 <- colorRampPalette(c("red","blue"));p1(2)
p2 <- colorRampPalette(c("red","yellow"));p2(2)
showMe(p1(20))
p3 <- colorRampPalette(c("blue","green"), alpha = 0.5);p3(5)
plot(x,y, pch = 19, col = rgb(0, .5, .5, .3))
cols <- brewer.pal(3, "BuGn");showMe(cols)
pal <- colorRampPalette(cols)
showMe(pal(20))
image(volcano, col = pal(20))

#Lesson 8&9&10 GGPlot2 
str(mpg)
qplot(displ,hwy,data = mpg)
qplot(displ, hwy, data = mpg, color = drv)#use different colors to distinguish between the 3 factors of drv
qplot(displ, hwy, data = mpg, color = drv, geom = c("point","smooth"))#add fit line area
qplot(y=hwy, data = mpg, color = drv)
qplot(drv, hwy, data = mpg, geom = "boxplot")
qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)
qplot(hwy, data = mpg, fill = drv)
qplot(displ, hwy, data = mpg, facets = .~drv)# . indicates a single row and drv implies 3, since there are 3 distinct drive factors
qplot(hwy, data = mpg, facets = drv ~ .,  binwidth = 2)
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"), facets = .~drv)
g <- ggplot(mpg, aes(displ, hwy))
g+geom_point()#数据存储在g中，调用geom_point画图
g+geom_point()+geom_smooth(method = "lm")#加上了拟合曲线和区间,geom_smooth也可以不加任何参数
g+geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)
g+geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)+ggtitle("Swirl Rules!")
g+geom_point(color = "pink", size = 4, alpha = 1/2)
g+geom_point(aes(color = drv), size = 4, alpha = 1/2)#the color of the points is data dependent, must use aes
g+geom_point(aes(color = drv))+labs(title = "Swirl Rules!")+labs(x = "Displacement", y = "Hwy Mileage")
g+geom_point(aes(color = drv), size = 2, alpha = 1/2)+geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)
g+geom_point(aes(color = drv))+theme_bw(base_family = "Times")
plot(myx,myy,type = "l",ylim = c(-3,3))
g <- ggplot(testdat,aes(x = myx, y = myy))
g+geom_line()
g+geom_line()+ylim(-3,3)
g+geom_line()+coord_cartesian(ylim = c(-3,3))
g <- ggplot(mpg, aes(x= displ, y= hwy, color = factor(year)))
g + geom_point() + facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")+labs(x = "Displacement", y = "Highway Mileage", title = "Swirl Rules!")
#using the diamonds dataset
qplot(price, data = diamonds)#histogram
range(diamonds$price)
qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)#"cut" makes the histogram more colorful
qplot(price, data = diamonds, geom = "density", color= cut)#replot the histogram as a density function which will show the proportion of diamonds
qplot(carat, price, data = diamonds, color = cut, facets = .~cut)+geom_smooth(method = "lm")
g <- ggplot(diamonds , aes(depth, price));summary(g)
g + geom_point(alpha = 1/3)
cutpoints <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)#找到分位点
diamonds$car2 <- cut(diamonds$carat,cutpoints); stageVariable("diamonds$car2",diamonds$car2)
g <- ggplot(diamonds, aes(depth, price))
g+geom_point(alpha=1/3)+facet_grid(cut~car2)+geom_smooth(method="lm",size=3,color="pink")
ggplot(diamonds,aes(carat,price))+geom_boxplot()+facet_grid(.~cut)

Lesson 11