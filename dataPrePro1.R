# 문제 1 - R 언어로 내가 태오난 요일을 다음 형식으로 출력해 보자.
# XXX 는 X요일에 태어났어요

BirthDay = as.Date("1992-09-09")
su = format(BirthDay,"%A")
cat("김동규는 ",su,"에 태어났어요",sep="")


# 문제 2 - R 언어로 내가 태어난지 며칠이 지났는지 다음 형식으로 출력해 보자.
# 오늘은 XXXX년 XX월 XX일 이고 내가 태어난지 XXXX일째되는 날이당
today = Sys.Date()
BirthDay = as.Date("1992-09-09")
wow = as.Date(today) - as.Date(BirthDay)
wow = as.numeric(wow)
cat("오늘은",format(today,"%Y년 %m월 %d일"),"이고 내가 태어난지",wow,"일째되는 날이당")


# 문제 3 - 현재시간을 기준으로 년월일시분 정보를 출력해 보자.
# XXXX년 XX월 XX일 XX시 XX분 XX초

today = Sys.time()
print(format(today,"%Y년 %m월 %d일 %H시 %M분 %S초"))


# 문제 4 - 텍스트 '12/25/2020 23:59:59', '1/25/2021 23:59:59', '2/25/2021 23:59:59'를 
# 데이터프레임의 datetime 변수에 저장한 후 이를 날짜 형식(POSIXlt 객체)으로 
# 변환한다.

# datetime = data.frame(날짜1='12/25/2020 23:59:59', 날짜2='1/25/2021 23:59:59', 날짜3='2/25/2021 23:59:59')
# datetime[1]$날짜1 = as.POSIXlt(as.Date(datetime[1]$날짜1, format="%m/%d/%Y %H:%M:%S"),origin="1970-01-01")
# datetime[2]$날짜2 = as.POSIXlt(as.Date(datetime[2]$날짜2, format="%m/%d/%Y %H:%M:%S"),origin="1970-01-01")
# datetime[3]$날짜3 = as.POSIXlt(as.Date(datetime[3]$날짜3, format="%m/%d/%Y %H:%M:%S"),origin="1970-01-01")
# class(datetime)

a1<-'12/25/2020 23:59:59'
a2<-'1/25/2021 23:59:59'
a3<-'2/25/2021 23:59:59'
datetime<-c(a1,a2,a3)
dateF<-data.frame(datetime)
x<-strptime(datetime,"%m/%d/%Y %H:%M:%S")
class(x)
# 문제 5 - 2020년 6월 1일부터 7일간의 월, 일, 요일을 seq() 함수를 이용하여 생성하고 
# 다음과 같은 형식으로 출력한다. 
# "월-0601" "화-0602" "수-0603" "목-0604" "금-0605" "토-0606" "일-0607"
start = as.Date("2020-06-01")
end = as.Date("2020-06-07")
날짜 = seq(start,end,length.out=7)
dayofweek = format(날짜, "%a")
monthandday = gsub("-","",substring(날짜,6))

paste(dayofweek,monthandday,sep="-")
#unlist(strsplit(text,split="\\s+"))


# 문제 6 -  'Happy', 'Birthday', 'to', You'로 구성된 5텍스트 벡터 v1 생성한 후 벡터의 길이와 문자 개수의 합을 계산한다. 
v1 = c('Happy', 'Birthday', 'to', 'You')
sum(nchar(v1),length(v1))


# 문제 7 - 6번 문제에서 생성한 텍스트 벡터 v1의 개별 원소들을 연결하여 다음과 같은 텍스트 벡터를 생성한다. 연결된 새로운 텍스트 벡터의 길이와 문자 개수의 합을 계산한다.
# "Happy Birthday to You"
 textv1=NULL
 for(i in 1:4)
  textv1 = paste(textv1, v1[i])
sum(nchar(textv1),length(textv1))
# collapse=" " : 따로따로말고 한번에 합쳐줌


# 문제 8 -  paste() 함수와 LETTERS 상수 벡터를 이용하여 다음과 같은 문자 벡터를 생성한다
# (첫 번째 벡터는 문자와 숫자 사이에 공백이 있으며, 두 번째 벡터는 문자와 숫자가 서로 붙어 있음).
# "A 1" "B 2" "C 3" "D 4" "E 5" "F 6" "G 7" "H 8" "I 9" "J 10"
# "A1" "B2" "C3" "D4" "E5" "F6" "G7" "H8" "I9" "J10"
spaceletter = NULL
nospaceletter = NULL
spaceletter = paste(LETTERS[1:10],1:10)
nospaceletter = paste0(LETTERS[1:10],1:10)
spaceletter
nospaceletter


# 문제 9 - 텍스트 'Good Morning'을 분할하여 다음과 같은 리스트 형식으로 출력한다.
# [[1]]
# [1] "Good"
# [[2]]
# [1] "Morning"
list(strsplit("Good Morning", " ")[[1]][1],strsplit("Good Morning", " ")[[1]][2])


# 문제 10 -  다음 텍스트 벡터를 단어 단위로 분할한다. 단, 모든 쉼표(,)와 하이픈(-)을 제거한다.
# c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
#   "That's why we call it the present – from kung fu Panda")

words = c("Yesterday is history, tommrrow is a mystery, today is a gift!",
  "That's why we call it the present – from kung fu Panda")
gsub("[[:punct:]]","",unlist(strsplit(words, " ")))


# 문제 11 -  다음 주민등록번호 세 개를 ssn 변수에 저장하고, 
# 뒤 일곱 자리의 숫자를 '*******'으로 대체한다.
# "941215-1234567" "850605-2345678" "760830-1357913"

ssn = c("941215-1234567", "850605-2345678", "760830-1357913")
substring(ssn,8)<-"*******";ssn

# 문제 12 -  다음 문자열을 s1 변수에 저장한 다음 요구 사항대로 처리한다.
# 
# "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
# 
# (1) 한글만 삭제하여 r1 에 저장 한다.
# (2) 특수문자들을 삭제하여 r2 에 저장 한다.
# (3) 한글과 특수문자들을 삭제하여 r3 에 저장 한다.
# (4) 100을 '백'으로 변환하여 r4에 저장 한다.

s1 = "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 = gsub("[가-힣]", "", s1);r1
r2 = gsub("[[:punct:]]", "", s1);r2
r3 = gsub("[가-힣]|[[:punct:]]", "", s1);r3
r3 = gsub("[가-힣[:punct:]]", "", s1);r3
r4 = gsub("100", "백", s1);r4

