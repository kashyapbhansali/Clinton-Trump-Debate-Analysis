install.packages("tm")
install.packages("wordcloud")

library(tm)
library(wordcloud)
library(igraph)
library(SnowballC)
#create some sample data

#load clintons text line by line 174 documents
#sample.tennis = c("Oh, I absolutely love Roger, even he lost to Djokovic in
#                  IndianWells Yesterday.",
#                  "Tennis! It must be love!",
#                  "USOpen tickets cost about 100 per ticket.",
#                  "I love tennis I can not lie! ")

sample.tennis <- scan("C:\\Users\\kashyap\\Desktop\\DV\\lab_text\\text-analysis-lab\\trump_debate.txt", what="", sep="\n")

corp <- Corpus(VectorSource(sample.tennis))
dtm <- DocumentTermMatrix(corp)   
inspect(dtm)
wordcloud(corp, min.freq=25, color=brewer.pal(6, "Dark2") )
#plot word relations
#install.packages("igraph")

tdm = as.matrix(tdm)
termMatrix <- tdm %*% t(tdm)
g <- graph.adjacency(termMatrix, weighted=T, mode = "undirected")
plot(g)
#Text processing
corp <- tm_map(corp, removePunctuation)
corp <- tm_map(corp, removeNumbers)
corp <- tm_map(corp, removeWords, stopwords("english"))
corp <- tm_map(corp, stripWhitespace)
#install.packages("SnowballC")

#corp <- tm_map(corp, stemDocument)
#corp <- tm_map(corp, content_transformer(tolower))
#corp <- tm_map(corp, PlainTextDocument) #avoid tm 0.6 issue
#remove your OWN stopwords
myStopwords <- c("can","and")
myCorpus <- tm_map(corp, removeWords, myStopwords)
wordcloud(myCorpus, colors=brewer.pal(5,"Set1"),random.order=FALSE,
          max.words=50)


