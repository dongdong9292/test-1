url = "https://movie.naver.com/movie/bi/mi/point.nhn?code=189111"
text <- read_html(url,  encoding="CP949")
review_imsi = html_nodes(text, ".desc_review")
review = html_text(review_imsi, trim = T)
review

grade_imsi = html_nodes(text, ".emph_grade")
grade = html_text(grade_imsi, trim = T)
grade

daummovie = data.frame(평점=grade, 리뷰=review)
daummovie

write.csv(daummovie, "daummovie1.csv")
