# 링크 클릭으로 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome") # 상황에 따라서 한번 호출
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$open()
remDr$navigate(url)

#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()}) # simpleapply의 약자
# doms1이 갖고 있는 원소 개수 만큼 호출됨. 호출될때마다 펑션에 전달해줌. 
# 전달된 x(원소)를 가지고 실행하면 실행된 결과를 어디에다가 담음. 리스트에 담을수도 벡터에 담을 수도 있는데
# sapply이므로 가급적 벡터 아니면 리스트에 담는다. 뭘 전달했느냐에 따라 다름.
# getElementText는 컨텐트를 뽑는 함수..

repl_v <- c(repl_v, unlist(vest_repl)) # c함수를 이용해서 기존 벡터에 계속 붙이겠다.. 

toralReview <- remDr$findElement(using='css','span.u_cbox_in_view_comment') # 엘먼트 객체 하나만 리턴
toralReview$clickElement()
#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

repeat {
  for (i in 4:12) {              # 10 페이지씩  
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextListLink<-remDr$findElement(using='css',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement() # 클릭 엘먼트는 페이지 이동이라는 뜻.
    Sys.sleep(1) # 렌더링동안 잠시 일할시간 주는 것.
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElement(using='css',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  # next 페이지에 널이 날수도있고, 에러가 날 수 있음. 트라이 함수에다가 넣었기 때문에... 에러가 나더라도 무시해 라는 뜻.
  if(length(nextPage) == 0)  break; # next페이지가 없으면 repeat 구문을 빠져나오자.
  nextPage$clickElement() # 그게 아니면 다음페이지 클릭.
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "webtoon2.txt")









# [ 신라스테이 호텔에 대한 전체 페이지 댓글 읽기 ]
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-yeoksam/hotel/seoul-kr.html?
asq=z91SVm7Yvc0eRE%2FTBXmZWCYGcVeTALbG%2FvMXOYFqqcm2JknkW25Du%2BVdjH%2FesXg8ORIaVs1PaEgwePlsVW
fwf3sX%2BVNABRcMMOWSvzQ9BxqOPOsvzl8390%2BEhEylPvEiBp0eoREr2xLYHgqmk0Io4J1HYEzEOqyvdox%2BwS6yxHeonB9lh7mJsBIjSBPoMzBLFW01k%2
BU8s2bGO6PcSdsu3T30HwabyNzwNYKiv%2BRDxfs%3D&hotel=699258&tick=637215342272&languageId=9&userId=bcb7ecc6-7719-465f-bf29-951e3973
3c66&sessionId=uouhnqjisace4freagmzbxxc&pageTypeId=7&origin=KR&locale=ko-KR&cid=-1&aid=130243&currencyCode=KRW&htmlLanguage=ko-kr
&cultureInfoName=ko-KR&ckuid=bcb7ecc6-7719-465f-bf29-951e39733c66&prid=0&checkIn=2020-05-30&checkOut=2020-05-31&rooms=1&adults=1
&childs=0&priceCur=KRW&los=1&textToSearch=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC%20(Shilla%20Stay%20Yeoksam)
&productType=-1&travellerType=0&familyMode=off'
remDr$navigate(url) 
Sys.sleep(3)
pageLink <- NULL
reple <- NULL
curr_PageOldNum <- 2
repeat{
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  pageLink <- remDr$findElements(using='css',"#reviewSection > div:nth-child(6) > div > span:nth-child(3) > i ")
  remDr$executeScript("arguments[0].click();",pageLink)
  # arguments[0]이 무엇??
  # 앞에 예제는 엘먼트 받아와서 클릭했는데 여기서는 자바스크립트로 했음.
  # 페이지에 따라서는 가짜 태그를 갖다가 넣음.
  # 두번째 아규먼트가 반드시 list이어야 함.
  # args= 생략한거임..
  # find elements를 쓴거임.
  # arguments는 자바스크립트의 내장 객체임. 
  # 
  Sys.sleep(2)
  curr_PageElem <- remDr$findElement(using='css','#reviewSection > div:nth-child(6) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  cat(paste(curr_PageOldNum, ':', curr_PageNewNum,'\n'))
  if(curr_PageNewNum == curr_PageOldNum)  {
    cat("종료\n")
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum;
}
# 정적 스크래핑 할때는 페이지 1, 페이지 2 같이 하는데.
# 여기서는 마지막 페이지인지 체크하는 용도로 씀.
cat(length(reple), "개의 댓글 추출\n")
write(reple,"hotel.txt")














# [ YES24의 명견만리 댓글 읽어오기 ]
install.packages("RSelenium")
library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.yes24.com/24/goods/40936880")


webElem <- remDr$findElement("css", "body")
remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 3200)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 3200)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 3200)", args = list(webElem))
Sys.sleep(3)
repl_v = NULL
endFlag <- FALSE
page <- 3

repeat {
  for(index in 3:7) {
    fullContentLinkCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.reviewInfoBot.crop > a", sep='')
    fullContentLink<-remDr$findElements(using='css selector',  fullContentLinkCSS)
    if (length(fullContentLink) == 0) {
      cat("종료\n")
      endFlag <- TRUE
      break
    }
    remDr$executeScript("arguments[0].click();",fullContentLink);
    Sys.sleep(1)
    fullContentCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.reviewInfoBot.origin > div.review_cont > p", sep='')
    fullContent<-remDr$findElements(using='css selector', fullContentCSS)
    print(fullContent)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    print(repl)
    repl_v <- c(repl_v, unlist(repl))
  }
  if(endFlag)
    break;  
  
  if(page == 10){
    page <- 3
    nextPageCSS <- "#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a.bgYUI.next"
  }
  else{
    page <- page+1;
    nextPageCSS <- paste("#infoset_reviewContentList > div.review_sort.sortBot > div.review_sortLft > div > a:nth-child(",page,")",sep="")
  }

  remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
  nextPageLink<-remDr$findElements(using='css selector',nextPageCSS) 
  remDr$executeScript("arguments[0].click();",nextPageLink);
  Sys.sleep(5)
  print(page)
}
write(repl_v, "yes24.txt")