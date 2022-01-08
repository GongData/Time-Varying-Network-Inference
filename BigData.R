
load("drosophila_data_11genes.Rdata")

#original changepoints: 31, 41, 59
library(InspectChangepoint)

x=drosophila_data_11genes
x=t(x)
dim(x)
n=67
p=11
par(mfrow=c(2,1))
y=inspect(x, threshold=25)
y
plot(y, xlab="time, threshold = 25", ylab="Genes", main="A")

y=inspect(x, threshold=50)
y
plot(y, xlab="time points", ylab="Genes", main="B")


plot(table(unlist(y$changepoints[,1])))


x= read.table(file="dros067.txt", sep="")
x=t(x)
dim(x)
n=67
p=11
y=inspect(x, threshold=40)
y
plot(y)

niter = 200
result = NULL
for (i in 1:niter){
  result[[i]] = inspect(x, threshold=40)$changepoints[,1]
  printPercentage(i, niter)
}
plot(table(unlist(result)))


## more than 4000 genes
library(ARTIVA)
x=drosophila

x = x[sample(1:4028, 500),]
y=inspect(x, threshold=100)
y
plot(y)


par(mfrow=c(1,3))
niter = 100
result = NULL

for (i in 1:niter){
x=drosophila
x = x[sample(1:4028, 400),]
  result[[i]] = inspect(x, threshold=175)$changepoints[,1]
#  printPercentage(i, niter)
}
plot(table(unlist(result)), xlab = "time points", ylab="frequencies", main="(C): threshold = 175")


## below is not good
x=drosophila
threshold <- compute.threshold(67, 100)
niter = 200
result = NULL
for (i in 1:niter){
x=drosophila
x = x[sample(1:4028, 100),]
  result[[i]] = inspect(x, threshold=threshold)$changepoints[,1]
  printPercentage(i, niter)
}
plot(table(unlist(result)), xlab = "time points", ylab="frequencies", main="A")
 

