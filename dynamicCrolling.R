install.packages("RSelenium")
library(RSelenium)
remDr = remoteDriver(remoteServerAddr = "localhost",
                     port=4445, browserName = "chrome")

remDr$open()
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")

webElem<-remDr$findElement(using = "css", "[name = 'query']")
# 네임이라는 속성이 q를 가지고 있는 값을 찾아와라
webElem$sendKeysToElement(list("서지혜", key = "enter"))
# 해당 엘레멘트에다가 키를 전달하겠다..
# 돔 객체가 하나일 때 호출하는 함수
# 여러개 일 때는 반복문.

