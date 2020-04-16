install.packages("RSelenium")
library(RSelenium)
remDr = remoteDriver(remoteServerAddr = "localhost",
                     port=4445, browserName = "chrome")

remDr$open()
url='http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)


#베스트 댓글 내용 읽어오기
bestReviewNodes = remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
best = sapply(bestReviewNodes,function(x){x$getElementText()}) # best는 리스트 형태로 리턴
unlist(best)

#전체 댓글 링크 클릭후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(totalReviewNodes,function(x){x$getElementText()})

for(j in 1:5){
  Sys.sleep(1)
  for (i in 4:13) {
    nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
    nextPage<-remDr$findElement(using='css',nextCss)
    nextPage$clickElement()
    Sys.sleep(2)
  } 
  totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  best2 = sapply(totalReviewNodes,function(x){x$getElementText()})
  unlist(best2)
}

# 영화리뷰
# nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
# imsi <- html_text(nodes, trim=TRUE)
# review <- imsi[nchar(imsi) > 0]
# review
# if(length(review) == 10) {
#   page <- cbind(title, point)
#   page <- cbind(page, review)
#   write.csv(page, "movie_reviews.csv")
# } else {
#   cat("리뷰글이 생략된 데이터가 있네요ㅜㅜ\n")
# }

