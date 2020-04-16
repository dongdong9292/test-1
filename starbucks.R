install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")

remDr$open()
Sys.sleep(1)
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)
Sys.sleep(3)

doms1 <- remDr$findElements(using = "css selector", "#container > div > form > fieldset > div > section > article.find_store_cont >article > 
                           article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")

sapply(doms1,function(x){x$clickElement()})  
Sys.sleep(1)
try(doms2 <- remDr$findElements(using = "css selector", "#mCSB_2_container > ul > li:nth-child(1) > a"))
sapply(doms2,function(x){x$clickElement()})
Sys.sleep(1)

shopnames <- NULL
lats <- NULL
lngs<- NULL
addrs <- NULL
telephones <- NULL

limit <- remDr$findElements(using = "css selector","#container > div > form > fieldset > div > section >
  article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span")
limit <- sapply(limit, function (x){x$getElementText()})
limit

  for(i in 1 : as.numeric(limit)){
  shopname <- remDr$findElements(using = "css selector", paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong"))
  shopname <- sapply(shopname, function (x){x$getElementText()}) # 역삼아레나빌딩
  shopnames <- c(shopnames,shopname)
  shopnames
   
  latandlng <- remDr$findElements(using = "css selector", paste0("#mCSB_3_container > ul > li:nth-child(",i,")"))
  lat <- sapply(latandlng, function (x){x$getElementAttribute("data-lat")}) # 위도
  lng <- sapply(latandlng, function (x){x$getElementAttribute("data-long")}) # 경도
  lats <- c(lats,lat)
  lngs <- c(lngs,lng)
  
  addrandphone <- remDr$findElements(using = "css selector", paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p"))
  addrandphone <- sapply(addrandphone, function (x){x$getElementText()}) # 주소와 전화번호
  
  addr <- unlist(strsplit(unlist(addrandphone),split="\n"))[1] 
  telephone <- unlist(strsplit(unlist(addrandphone),split="\n"))[2]
  
  addrs <- c(addrs, addr)
  telephones <- c(telephones, telephone)
  
  if(i %% 3 == 0 && i != limit)
    remDr$executeScript(
      "var dom=document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]];
      dom.scrollIntoView();", list(i))
  }


shopinfo <- data.frame(
  매장명=unlist(shopnames), 
  위도=unlist(lats),
  경도=unlist(lngs),
  주소=unlist(addrs),
  전화번호=unlist(telephones)
)
write.csv(shopinfo, "starbucks.csv") 





