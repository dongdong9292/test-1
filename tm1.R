library(KoNLP)
hotel_data <- readLines("hotel.txt")
hotel_data <- extractNoun(hotel_data)
hotel_data <- unlist(hotel_data)
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
