install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")

remDr$open()
url<-'https://hotel.naver.com/hotels/item?
hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=
%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC
%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url)

Sys.sleep(3)


nextPage <- NULL
lastPage <- NULL
reple <- NULL
repeat{
  doms <- remDr$findElements(using = "css selector", ".review_desc p.txt.ng-binding")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x){x$getElementText()}) # 댓글 내용 추출
  print(reple_v) # 콘솔창 출력력
  reple <- append(reple, unlist(reple_v)) # 전체 리플에 현재 리플 추가.
  cat(length(reple), "\n") # 전체 리플 길이 출력

  try(nextPage<-remDr$findElement(using="css selector","body > div > div.ng-scope > div.container.ng-scope > div.content > 
                                  div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next"))
  nextPage$clickElement()
  
  if(length(nextPage)==0) break; 
  # next페이지가 없으면 repeat 구문을 빠져나오자.
  # nextPage$clickElement()
  # sapply(nextPage,function(x){x$clickElement()})
  Sys.sleep(1)
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"hotel.txt")



