# Substitution during Physalia course
library(imageRy)

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

m1992c <- im.classify(m1992, num_clusters=2)
# class 1 = human related areas and water
# class 2 = forest
x <- subst(m1992c, c(1,2), c("forest","other"))

