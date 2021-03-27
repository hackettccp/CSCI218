library(ggplot2)

pchisq(8.16, df=2, lower.tail=FALSE)


x <- rchisq(100000, df = 2)
y <- rchisq(100000, df = 5)
z <- rchisq(100000, df = 10)


ggplot() +
  geom_density(data=as.data.frame(dchisq(x, 2)), aes(x=x), color="red") +
  geom_density(data=as.data.frame(dchisq(y, 5)), aes(x=y), color="blue") +
  geom_density(data=as.data.frame(dchisq(z, 10)), aes(x=z)) +
  scale_x_continuous(breaks=seq(0, 20, 5), limits=c(0,20))