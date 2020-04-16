png(filename="wc.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
words <- readLines("공구.txt",encoding="UTF-8")
words
words <- extractNoun(words)
words
words <- unlist(words)
words
words = gsub("[^가-힣]","",words)
words = gsub("공구.*", "", words)
words = gsub("해주", "", words)
words = gsub("이요", "", words)
words = gsub("워머", "", words)
words = gsub("롱기", "", words)
words = gsub("리큅", "", words)
words = gsub("부탁", "", words)
words = gsub("제공", "", words)
words
# head(words)
words <- Filter(function(x) {nchar(x) >= 2}, words)
words
words <- table(words)
words
words <- sort(words, decreasing = T)
words
str(words)
result = as.data.frame(result)
result


windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(result$words, result$Freq, 
          min.freq = 2, 
          random.order = FALSE, 
          rot.per = 0.5, scale = c(15, 1), 
          colors = rainbow(20))

dev.off()
