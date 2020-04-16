url = "https://movie.daum.net/moviedb/grade?movieId=134008&type=netizen&page="
text = NULL
review = NULL
grade = NULL
daummovie2 = NULL
for(i in 1: 20) {
url <- paste(site, i, sep="")
text = read_html(url,  encoding="CP949")

review_imsi = html_nodes(text, ".desc_review")
review = html_text(review_imsi, trim = T)
review
grade_imsi = html_nodes(text, ".emph_grade")
grade = html_text(grade_imsi, trim = T)
grade
review = imsi[nchar(imsi) > 0]
if(length(review) == 10) {
  page = cbind(title, point)
  page = cbind(page, review)
  movie.review <- rbind(movie.review, page)
} else {
  cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
}
}

write.csv(daummovie, "daummovie2.csv")

