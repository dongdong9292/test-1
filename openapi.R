# [OPEN API 실습1]
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("코로나","euc-kr","UTF-8"))

doc<- GET(searchUrl, query = list(query=query, display=100), 
          add_headers('Content-Type' = "application/xml",
                      'X-Naver-Client-Id' = Client_ID,
                      'X-Naver-Client-Secret' = Client_Secret))

doc2 <- htmlParse(doc, encoding="UTF-8") 
text<- xpathSApply(doc2, "//item/description", xmlValue)
text <- gsub("</?b>", "", text)
text <- gsub("&quot", "", text)
text <- gsub("&gt", "", text)
text
write(text, "naverblog.txt")




# [OPEN API 실습2]
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
  access_secret = access_token_secret
)

key <- "취업"
key <- enc2utf8(key) 
result <- search_tweets(key, n=100, token = twitter_token) 
str(result)
result$retweet_text
content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:punct:]]", "", content)
content <- gsub("\n", "", content)
content <- gsub("([단독])", "", content)
content[which(is.na(content))] = ""
content
write(content, "twitter.txt")






# [OPEN API 실습3]
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
# xml을 데이터 프레임으로 바꿔라
df
str(df)
View(df)
노선ID <- df$busRouteId
노선길이 <- df$length
기점 <- df$stStationNm
종점 <- df$edStationNm
배차간격 <- df$term

cat("[360번 버스정보]",
    "\n노선 ID : ",levels(노선ID),
    "\n노선길이 : ",levels(노선길이),
    "\n기점 : ", levels(기점),
    "\n종점 : ", levels(종점),
    "\n배차간격 : ", levels(배차간격)
    )







# [OPEN API 실습4]
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID,
                            "X-naver-Client-Secret" = Client_Secret))
json_data <- content(doc, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)

df.doc =data.frame(json_obj)
View(df.doc)
text <- df.doc$items.title
text
text <- gsub("</?b>", "", text)
text <- gsub("&quot", "", text)
text <- gsub("&gt", "", text)
write(text, "navernews.txt")












