library(KoNLP)
hotel_data <- readLines("hotel.txt")
hotel_data <- extractNoun(hotel_data)
hotel_data <- unlist(hotel_data)
hotel_data = gsub("[^가-힣]","",hotel_data)
hotel_data
# hotel_data <- table(hotel_data)
# hotel_data
hotel_data <- Filter(function(x) {nchar(x) >= 2}, hotel_data)
hotel_data

hotel_data <- table(hotel_data)
hotel_data
hotel_data <- sort(hotel_data, decreasing = T)
hotel_data

result = head(hotel_data, 10)
result = as.data.frame(result)
result
class(result)
write.csv(result, "hotel_top_word.csv")

# word_data <-readLines("hotel.txt")
# word_data %>% 
#   gsub("[^가-힣]," ", .)  마지막에 .을 주면 아규먼트로 인식 
# %>% extractNoun %>%  unlist %>% 