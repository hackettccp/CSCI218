library(ggplot2)

lefttail <- function(x, t) {
  left <- dchisq(x, 3)
  left[x<=t] <- NA
  return(left)
}

x <- rchisq(100000, df = 3)

ggplot() +
  stat_function(fun = lefttail, args = list(t=5.9), geom="area", fill="steelblue") +
  geom_density(data=as.data.frame(dchisq(x, 3)), aes(x=x), color="black") +
  scale_x_continuous(breaks=seq(0, 20, 5), limits=c(0,20))