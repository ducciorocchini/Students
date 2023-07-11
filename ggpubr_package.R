# Alessandro Mercurio


library(ggpubr)    # to add a common legend in ggplot

# https://rpkgs.datanovia.com/ggpubr/


ggplot(Table1, aes(x=cover, y=percent2021, color=cover)) + geom_bar(stat="identity", fill="white")

ggplot(Table1, aes(x=cover, y=percent2022, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(Table1, aes(x=cover, y=percent2021, color=cover)) + geom_bar(stat="identity", fill="white") +
  ggtitle(" Year 2021") + ylim(c(0,50))

p2 <- ggplot(Table1, aes(x=cover, y=percent2022, color=cover)) + geom_bar(stat="identity", fill="white")+
  ggtitle(" Year 2022") + ylim(c(0,50))

ggarrange(p1, p2, ncol=2, nrow=1, common.legend = TRUE,legend="right")
