library(tidyverse)
library(ggplot2)
library(gcookbook)

SRSplot <- df %>%
  ggplot(aes(x=factor(Home_Off_Type)))
SRSplot+geom_histogram(stat="count", binwidth=1)

summary(df)



#Correspondence Analysis
library(ca)

#Correspondence Matrix
P = Lines.vs.Ranks1/sum(Lines.vs.Ranks1)
round(P,3)

#Mosaic Plot
rownames(StoresAndAges)
mosaicplot(StoresAndAges, shade=T, main="")

mosaicplot(Lines.vs.Ranks1, shade=T, main="")

# The ca library has a nice correspondence analysis function

c = ca(Lines.vs.Ranks1)
summary(c)
c$N
c$rowcoord



#Looking at first two coordinates for the rows
rowC = c$rowcoord[ , 1:2]
rowC[order(rowC[,1]), ] #sort by first coordinate
rowC[order(rowC[,2]), ] #sort by second coordinate

#visualization of the row categories
plot(c, what=c("all", "none")) #all of the rows and none of the columns

#Viz the first two coords for the columns
colC = c$colcoord[ , 1:2]
colC[order(colC[,1]), ]
colC[order(colC[,2]), ]
plot(c, what=c("none", "all"))

#full symmetric plot
plot(c)

#draw lines
plot(c, mass=T, contrib="absolute", map="rowgreen", arrows=c(F,T))
#another more simple way
plot(c, mass=T, arrows=c(F,T))
#obtuse angle means it is less than expected
#actute angle means it is more than expected


library(factoextra)
eigenvals = get_eigenvalue(c)
eigenvals
