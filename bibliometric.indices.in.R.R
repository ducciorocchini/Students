# Suggested by Daniele Da Re

# source: https://www.bibliometrix.org/vignettes/Introduction_to_bibliometrix.html
library(bibliometrix)
file <- "scopus.bib" #file latex con i vostri articoli scaricato da scopus, web of science, etc

# convert bibtex to bibliometic file
M <- convert2df(file = file, dbsource = "scopus", format = "bibtex")

# get indexes and total citations
indices <- Hindex(M, field = "author", elements="DA RE D", sep = ";" )# years = 10
indices
head(indices$CitationList[[1]])
