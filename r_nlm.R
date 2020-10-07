
## Use nlm. 
f=function(rr,m,s) dnorm(rr,mean=m,sd=s)+dnorm(-rr,mean=m,sd=s)
minusl=function(params,r){
  mu=params[1]
  sigma=exp(params[2])
  -sum(log(f(r,mu,sigma)))
}

# original data -----------------------------------------------------------


ymat <- read.csv("ymat.csv",header = FALSE)
thetamat <- matrix(0, nrow = 2, ncol = 15)
tictoc::tic()
for (i in 1:15){
y <- ymat[,i]
model <- nlm(minusl,c(1,log(10)), r = y) 
muest <- model$estimate[1]; sigmaest=exp(model$estimate[2])
thetamat[,i] <- c(muest * sign(muest),sigmaest)
}
t1 <- tictoc::toc()
thetamat_nlm <- thetamat

thetamat_EM <- as.matrix(read.csv("thetamat_EM.csv", header = FALSE))
max(thetamat_nlm - thetamat_EM)

minusl_diff <- rep(0,15)
for (i in 1:15){
y <- ymat[,i]
minusl_diff[i] <- minusl(c(thetamat_EM[1,i],log(thetamat_EM[2,i])),y) - minusl(c(thetamat_nlm[1,i],log(thetamat_nlm[2,i])),y)
}
max(minusl_diff)



# translated data ---------------------------------------------------------
 
ymat <- read.csv("ymat_t.csv",header = FALSE)
thetamat <- matrix(0, nrow = 2, ncol = 15)
tictoc::tic()
for (i in 1:15){
  y <- ymat[,i]
  model <- nlm(minusl,c(1,log(10)), r = y) 
  muest <- model$estimate[1]; sigmaest=exp(model$estimate[2])
  thetamat[,i] <- c(muest * sign(muest),sigmaest)
}
t2 <- tictoc::toc()
thetamat_nlm <- thetamat

thetamat_EM <- as.matrix(read.csv("thetamat_EMt.csv", header = FALSE))
max(thetamat_nlm - thetamat_EM)

minusl_diff <- rep(0,15)
for (i in 1:15){
  y <- ymat[,i]
  minusl_diff[i] <- minusl(c(thetamat_EM[1,i],log(thetamat_EM[2,i])),y) - minusl(c(thetamat_nlm[1,i],log(thetamat_nlm[2,i])),y)
}
max(minusl_diff)


t1$toc - t1$tic
t2$toc - t2$tic
