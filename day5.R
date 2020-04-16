# 교재 81페이지
library()
installed.packages()
search()
# 지금까지 사용한 함수들의 대부분은 base에 포함되어 있음.
# search 로드가 된 패키지의 리스트를 보여줌.
read_excel()
# 밑에 패키지 설치했다고 바로되는거 아님
# load를 해야 사용가능.
install.packages("readxl")
library(readxl) # require(readxl)
excel_data_ex <- read_excel("book/data_ex.xls")
# tibble advenced dataFrame.
getwd()
View(excel_data_ex)
search()

# 웹 크롤링과 스크래핑

install.packages("rvest")
# 추가 패키지 설치.
# 설치된거 확인 installed
# 오른쪽 하단에 Packages 탭 확인 
# 체크박스 체크여부에 따라 로드 상황여부 확인 가능.
library(rvest)
detach("rvest")
# 내부적으로 xml2 라는 패키지 사용함.
url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text
# 첫 원소에는 head
# 두 번째 원소에는 body라는 태그가 들어 있음.
# 
nodes <- html_nodes(text, "div")
# 응답된 도큐멘트 내용을 가지고 css 선택자에 맞는 노드들을 줘라.
# css가 매개변수 2번째. 
# xpath가 매개변수 3번째.. xpath="" ~하면 됨.
nodes
# div 태그 3개만 찾아옴.
title <- html_text(nodes)
# 컨텐트 읽어주는 함수.
# innerHTML과 비슷함.
# 노드들이 3개 찾아졌는데 3개의 div태그에 대하여 각각 컨텐츠 찾아서 리턴해줌.
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
# 첫번째 div를 찾아서 
node1
html_text(node1)
html_attr(node1, "style")
# 찾아진 노드에 대하여 두번째 아규먼트에 해당되는 속성 값을 꺼냄.

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")
# Style 속성이 없어서 NA

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)


# 단일 페이지(rvest 패키지 사용)
install.packages("rvest");
library(rvest)
text<- NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url,  encoding="CP949")
text
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
# 영화리뷰 
nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
imsi <- html_text(nodes, trim=TRUE)
review <- imsi[nchar(imsi) > 0]
review
if(length(review) == 10) {
  page <- cbind(title, point)
  page <- cbind(page, review)
  write.csv(page, "movie_reviews.csv")
} else {
  cat("리뷰글이 생략된 데이터가 있네요ㅜㅜ\n")
}


#-------------------------------------------------------------------------------------
# 여러 페이지
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0]
  if(length(review) == 10) {
    page <- cbind(title, point)
    page <- cbind(page, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
write.csv(movie.review, "movie_reviews2.csv")

# 한국일보 페이지(XML 패키지 사용)
install.packages("XML")
library(XML)
imsi <- read_html("http://hankookilbo.com")
t <- htmlParse(imsi)
content<- xpathSApply(t,"//p[@class='title']", xmlValue); 
content
content <- gsub("[[:punct:][:cntrl:]]", "", content)
content
content <- trimws(content)
content

# httr 패키지 사용 - GET 방식 요청
install.packages("httr")
library(httr)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
title2 = html_nodes(read_html(http.standard), 'div.toc h2')
title2 = html_text(title2)
title2

# httr 패키지 사용 - POST 방식 요청
library(httr)
library(rvest)
#httr 하고 rvest를 다시 해줘야 함.
# POST 함수를 이용해 모바일 게임 랭킹 3월 15일 주  모바일 게임 랭킹을 찾는다
#(http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week)
game = POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week',
            encode = 'form', body=list(txtPeriodW = '2020-03-15'))
title2 = html_nodes(read_html(game), 'a.tracktitle')
title2 = html_text(title2)
title2[1:10]


# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
res = GET('https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001')
htxt = read_html(res)
link = html_nodes(htxt, 'div.list_body a'); length(link)
article.href = unique(html_attr(link, 'href')) # 중복 제거
article.href

# 이미지, 첨부파일 다운 받기
# pdf
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')
# 이미지도 끌어올 수 있음.
# get 함수말고 content 라는 함수가 있음.서버와 바디로 구분되는데, 2번째 아규먼트가 raw면 binary를 읽어오겠다, text면 text를 읽어오겠다 라는 뜻.
# get으로 요청해서 받아오고 그것을 컨텐트로 바이너리로 읽겠다. 또 writeBin으로 
# writeBin으로 저장까지한다.


# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 
# temp디렉토리에는 R1~R~ 이미지가 저장됨.

