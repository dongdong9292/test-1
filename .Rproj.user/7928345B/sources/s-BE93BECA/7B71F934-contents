# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "", word)
sub(" ","@",word)
# gsub는 global 의미,, 
# sub는 최초에 찾은것만..
gsub("A", "", word)
gsub("a", "", word)
gsub("Aa", "", word)
gsub("(Aa)", "", word)
# 소괄호는 그룹핑 시키는것. 대문자 A와 소문자a가 같이 나오는애를 의미
gsub("(Aa){2}", "", word);gsub("Aa{2}", "", word)
gsub("(Aa){2}", "", word)
# 9번째와 같은데, 횟수를 줄 수 있어서 의미가 있음.
gsub("[Aa]", "", word)
gsub("[가-힣]", "", word)
# 대괄호 안에 마이너스 기호는 범위를 의미함.
gsub("[^가-힣]", "", word)
# 정규표현식 앞의 '^'는 not의 의미. 한글이 아닌 애들을 지우시오. 
gsub("[&^%*]", "", word)
gsub("[[:punct:]]", "", word)
# 특수문자를 없애시오.
gsub("[[:alnum:]]", "", word)
# alnum은 알파벳, 뉴머릭,, 문자와 숫자를 없애시오.
gsub("[1234567890]", "", word)
gsub("[0-9]", "", word)
gsub("\\d", "", word);gsub("\\D", "", word)
# \\는 escape문자로 쓰임. 대문자 D는 숫자가 아닌 애들을 의미.
gsub("[[:digit:]]", "", word)
gsub("[^[:alnum:]]", "", word)
gsub("[[:space:]]", "", word);

gsub("[[:digit:][:punct:]]", "", word)
# 대괄호 안에 두개 넣으면 됨.

# [ 네이버 웹툰 댓글 읽기 ]
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)

#단수형으로 노드 추출
more<-remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
more$getElementTagName()
more$getElementText()
more$clickElement()


# 2페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기 
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(2)
}

#복수형으로 노드 추출 
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(bestReviewNodes,function(x){x$getElementText()})

#전체 댓글 링크 클릭후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(totalReviewNodes,function(x){x$getElementText()})
