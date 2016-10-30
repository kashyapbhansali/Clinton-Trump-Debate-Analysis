library(tm)
library(wordcloud)
library(igraph)

#load clintons text line by line 174 documents
sample.clinton <- scan("C:\\Users\\kashyap\\Desktop\\DV\\lab_text\\text-analysis-lab\\clinton_debate.txt", what="", sep="\n")

corp <- Corpus(VectorSource(sample.clinton))

stopwords("english")
#Text processing
corp <- tm_map(corp, tolower)
corp <- tm_map(corp, PlainTextDocument)
inspect(corp)
corp <- tm_map(corp, removePunctuation)
corp <- tm_map(corp, removeNumbers)
corp <- tm_map(corp, removeWords, stopwords("english"))
corp <- tm_map(corp, stripWhitespace)

myStopwords <- c("also","thats","will","just","get","got")
corp <- tm_map(corp, removeWords, myStopwords)

wordcloud(corp, min.freq=25, color=brewer.pal(6, "Dark2") )


dtm <- DocumentTermMatrix(corp)
tdm <- removeSparseTerms(TermDocumentMatrix(corp,control=list()),0.9)
tdm = as.matrix(tdm)
termMatrix <- tdm %*% t(tdm)
g <- graph.adjacency(termMatrix, weighted=T, mode = "undirected")
plot(g)