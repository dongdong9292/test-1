words <- readLines("yes24.txt")
words <- extractNoun(words)
words
words <- unlist(words)
words = gsub("[^가-힣]","",words)
words <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <=4}, words)
words <- table(words)
words <- sort(words, decreasing = T)
words
result = as.data.frame(words)
wordcloud2(result,rotateRatio = 0.5,size=0.7,col="white",backgroundColor = "black",shape = "star")
