data = read.csv('C:/Users/kevin/OneDrive/Documentos/2. Repo/1. MIIC/fpgrowth/PERSONA_BDP.csv', sep=',')
datas <-data[,c(10,11,14,15,32,33,36,37,38,39,55,56,77,78)]
dphd <- subset(datas, PCP17_A == 7 & PCP6 == 1)

dphd <- dphd[, !(names(dphd) %in% c("PCP17_A"))]
dphd <- dphd[, !(names(dphd) %in% c("PCP6"))]

r <- fim4r(dphd, method="fpgrowth", target="rules", supp=.2, conf=.5)

rframe <- as(r, "data.frame")
install.packages("arules")
library(arules)

r2 <- apriori(dphd, parameter = list(support=0.2, confidence =0.5))
rframe2 <- as(r2, "data.frame")
