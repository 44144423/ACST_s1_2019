singapore_economy <- read.csv("D:/我的文档/学习/890/quiz/singapore.economy.csv", na = "NA")
View(singapore_economy)
dataset=singapore_economy

dataset1 <-na.omit(dataset)

plot(dataset1$gdp~dataset1$time,xlab = "Time",ylab = "GDP(%)", main = "Singapore GDP growth") 

y <- function(x)(c(mean=mean(x),sd=sd(x)))
state.table=by(dataset1$gdp, dataset1$period,y)
state.table

pairs(~dataset1$gdp+dataset1$exp+dataset1$epg+dataset1$hpr+dataset1$gdpus+dataset1$oil+dataset1$crd+dataset1$bci)

lm=lm(dataset1$exp~dataset1$gdp)
summary(lm)

mm=lm(dataset1$gdp~dataset1$exp+dataset1$epg+dataset1$hpr+dataset1$gdpus+dataset1$oil+dataset1$crd+dataset1$bci)
summary(mm)

q=quantile(dataset1$gdp,c(.05))
q
state=rep("crisis",nrow(dataset1))
state[dataset1$gdp>=q]="normal"
state=as.factor(state)
dataset2=data.frame(dataset1,state)
dataset3 <- subset(dataset2, dataset2$period<3)
glm=glm(dataset3$state~dataset3$bci,family = binomial,data = dataset3)
summary(glm)
glm.probs=predict(glm,type="response")
glm.pred=rep("normal",72)
glm.pred[glm.probs<.5]="crisis"
table(glm.pred,dataset3$state)
(68+2)/72
mean(glm.pred==dataset3$state)
