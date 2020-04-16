# SNS의 Open API 활용
library(httr)
library(rvest)
library(XML)
rm(list=ls())

searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"


query <- URLencode(iconv("코로나","euc-kr","UTF-8")) # URLencode 함수 호출함.. 코로나라는 한글을 인코딩한 결과.. 16진수로 인코딩.
# euc-kr 을 UTF-8로 바꿔라 라는뜻 .
# iconv는 euc-kr로 인식하여 utf-8로 바꾸시오라는 의미
# utf-8방시그이 쿼리 문자열로 인식
# 
doc<- GET(searchUrl, query = list(query=query, display=20), 
          add_headers('Content-Type' = "application/xml",
                      'X-Naver-Client-Id' = Client_ID,
                      'X-Naver-Client-Secret' = Client_Secret))
# display=20은 20개만 보내줘라.
# add_headers는 httr 패키지가 제공함. 포스트방식으로 요청할때 또는 get에 헤더추가할때 httr 패키지 사용함.
# 응답받을 컨텐트 타입 지정.
# 네이버가 지정한 클라이언트 아이디, 클라이언트 시크릿.


# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8") 
# 응답이 XML이므로 돔객체를 만듬..

text<- xpathSApply(doc2, "//item/description", xmlValue)
# text
text <- gsub("</?b>", "", text) # ?의 의미는 ?앞에 문자가 0번 내지 1번
text <- gsub("&.+t;", "", text)
#  ? -----> 0,1
#  + -----> 1이상
#  * -----> 0이상
# a?b ---> ab, b
# xy?z ---> xyz, xz
# xy+z ---> xyz, xyyz, xyyyz, ... , xyyyyyyyyyyyyyyyyyz
# xy{3}z ---> xyyyz
# xy*z ---> xz, xyz, xyyz, xyyyz, xyyyyyz, .... , ...

# 어떤 문자가 몇개가 오든 하고싶음..
# x.+z  ---> .+ 임의의문자가 1번 이상.
# &.+t ----> &gt, &lt.......
text


# # 네이버 뉴스 연동  
# searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
# Client_ID <- "izGsqP2exeThwwEUVU3x"
# Client_Secret <- "WrwbQ1l6ZI"
# query <- URLencode(iconv("코로나","euc-kr","UTF-8"))
# doc<- GET(searchUrl, query = list(query=query, display=20), 
#           add_headers('Content-Type' = "application/xml",
#                       'X-Naver-Client-Id' = Client_ID,
#                       'X-Naver-Client-Secret' = Client_Secret))
# # 블로그 내용에 대한 리스트 만들기		
# doc2 <- htmlParse(doc, encoding="UTF-8")
# text<- xpathSApply(doc2, "//item/description", xmlValue); 
# # text
# text <- gsub("</?b>", "", text)
# text <- gsub("&.+t;", "", text)
# text

# 네이버 뉴스 연동  
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("코로나","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID,
                            "X-naver-Client-Secret" = Client_Secret))
# 요청 헤더를 add_headers로 전달.
# Open API를 아무나 사용할 수 없게끔 보안을 해놓음.
# Open API
# 네이버 뉴스 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
# htmlParse로 돔객체가 자동으로 생성됨.
text<- xpathSApply(doc2, "//item/description", xmlValue); 
# 리턴된 결과를 텍스트에 담았음.
text
text <- gsub("</?b>", "", text) # <b>와 </b> 둘다 없애야 함.?는 정규표현식에서 바로 앞에있는 애가 0번 내지 1번..
text <- gsub("&.+t;", "", text) # .하고 +의 기능 ??????? :
text








# 트위터 글 읽어오기
install.packages("rtweet")
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)
# 토큰 받아오기~

key <- "코로나"
key <- enc2utf8(key) # 함수로 하는거기때문에  enc2utf8 함수를 통해 utf8형식으로 바꾸는것임. 내부적으로 코드만 바뀜.
result <- search_tweets(key, n=500, token = twitter_token) # 얘네는 패키지를 만들어서 제공하기때문에 RESTAPI형식이 아님.
# search_tweets을 만들어서 줬음.
# key : 검색어
# n : 개수
# token : 
str(result)
result$retweet_text
content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content











library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
# xml을 데이터 프레임으로 바꿔라
df
str(df)
View(df)
busRouteId <- df$busRouteId
busRouteId




url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df











# 서울시 빅데이터- XML 응답 처리
# http://openapi.seoul.go.kr:8088/796143536a756e69313134667752417a/xml/LampScpgmtb/1/100/

library(XML)
key = '796143536a756e69313134667752417a'
contentType = 'xml'
startIndex = '1'
endIndex = '200'
url = paste0('http://openapi.seoul.go.kr:8088/',key,'/',contentType,'/LampScpgmtb/',startIndex,'/',endIndex,'/')
# 8088인이유 : 멀캠에서 80으로 나가도 8088로는 못나가게 함.
# 집에서는 됨.
# 
con <- url(url, "rb") 
imsi <- read_html(con)
t <- htmlParse(imsi, encoding="UTF-8")
upNm<- xpathSApply(t,"//row/up_nm", xmlValue) 
pgmNm<- xpathSApply(t,"//row/pgm_nm", xmlValue)
targetNm<- xpathSApply(t,"//row/target_nm", xmlValue)
price<- xpathSApply(t,"//row/u_price", xmlValue)

df <- data.frame(upNm, pgmNm, targetNm, price)
View(df)
write.csv(df, "edu.csv")











# 한국은행 결제 통계시스템 Open API - JSON 응답 처리
library(jsonlite)
key = '/4WQ7X833TXC370SUTDX4/'
contentType = 'json/'
startIndex = '1'
endIndex = '/100/'

url <- paste0('http://ecos.bok.or.kr/api/KeyStatisticList',key,contentType,'kr/',startIndex,endIndex)
response <- GET(url)
json_data <- content(response, type = 'text', encoding = "UTF-8")
# content 함수 이미지 크롤링 할때 했음.
# get 함수말고 content 라는 함수가 있음.서버와 바디로 구분되는데,
# 2번째 아규먼트가 raw면 binary를 읽어오겠다, text면 text를 읽어오겠다 라는 뜻.
# get으로 요청해서 받아오고 그것을 컨텐트로 바이너리로 읽겠다. 또 writeBin으로 
# writeBin으로 저장까지한다.


json_obj <- fromJSON(json_data)
# fromJSON은 R객체를 만들어내는 애
# toJSON은 객체를 제이슨으로 만듬.
df <- data.frame(json_obj)
df <- df[-1] # 인덱스 삭제
# 100이라는 열이 사라짐.
names(df) <- c("className", "unitName", "cycle", "keystatName", "dataValue")
View(df)

























# apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df

apply(df, 1, sum, na.rm=TRUE)# 6명 학생의 각각 몸무게와 키로 생각하면. 각 학생마다 몸무게와 키의 합을 더하는것.
# 하나라도 na 있으면 결과값이 na이므로 na.rm=True줌 na.rm은 apply에 의미가 있는것이 아니라 sum에 의미가 있음
apply(df, 2, sum, na.rm=TRUE)
#6명학생의 몸무게의합, 키의합..
# 행, 열단위로 연산할때 쓰는것이 apply

lapply(df, sum, na.rm=TRUE) # 행또는 열 마진 지정하지 않음. 열단위 우선 (1)과 동일. 리턴값이 리스트임.
sapply(df, sum, na.rm=TRUE) # sapply는 항상 벡터로 리턴하는 것이 아님.. 실제 리스트로 리턴하는 경우도 있음.
# 네임드 벡터로 리턴함.
tapply(1:6, gender, sum, na.rm=TRUE) # 1~6을 젠더가 가지고 있는 값을 기준으로 그룹을 나눠라.
tapply(df$w, gender, mean, na.rm=TRUE) # 젠더가 가지고있는 데이터 순서와 매치되어야함.
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5]) # multiple(함수가 맨앞에옴.) 함수를 맨앞에두게한 이유
# paste가 가변형이니까 ... 2~n 아규먼트에 대하여 첫번째 아규먼트 함수를 실행해라.



v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep="")) # v라는 벡터에 대하여 function 실행해라.
# sapply가 결과 보관해줌..sapply 주로 벡터로 리턴하지만,  경우에 따라서 리스트, 매트릭스로도 리턴함.
# R에서 함수 리턴안쓰면 마지막에 수행했던 연산결과 리턴함.


l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
# sapply의 결과는 단순히 그냥 벡터로 리턴. 그때그떄 다름.
lapply(l, function(d) paste("-",d,"-", sep=""))
# lapply는 무조건 리스트


flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)


#기억
nchar(flower) # 넘버오브케릭터 : 문자 길이 
#기억


sapply(flower, function(d) if(nchar(d) > 5) return(d)) # 길이가 5보다 큰 애들만 리턴해라.

sapply(flower, function(d) if(nchar(d) > 5) d) # 그냥 d를 출력하시오. 해도 그냥 d가 리턴됨.

sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA)) # 5보다 크지 않으면 아무것도 리턴안한다.
# (네임드벡터 리턴) 리스트로 리턴할 필요가 없으므로.

sapply(flower, function(d) paste("-",d,"-", sep="")) # 

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 4) # 조건을 그때그때 아규먼트로 전달할 수 있음. # 두번째 이후 아규먼트는 전달된 값을 쓴다.
# 깜박잊고 전달안했으면? 실제로 사용안하면 에러안남. 함수안에서 쓰고 있기 때문에 꼭 줘야함. 그래서 기본값 줘도됨.
count <- 1
myf <- function(x, wt=T){ #wt에 해당되는 아규먼트가 안오면 T로 쓰임. 
  print(paste(x,"(",count,")"))
  Sys.sleep(3)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result

sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]

