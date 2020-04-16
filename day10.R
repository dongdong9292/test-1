# 날짜와 시간 관련 기능을 지원하는 함수들

Sys.Date()  # 날짜만
Sys.time()  # 날짜 + 시간

class(Sys.Date()) # Date 객체 
class(Sys.time()) # 몇년 몇월을 데이트 객체로 바꿔서 시각화 또는 계산처리
# PoSIXct는 POSIXt의 자손 
# 내부적으로 1970년 1월 1일 0시를 기준으로 지금까지의 시간을 보관.
# 기본 포맷은 년도 날짜 

as.Date("2020-04-15") # Date형으로 변환하는 것.
as.Date("2020/04/15") # -, / 만 지원함.
as.Date("2020,04,15") # ,는 지원안함.
as.Date("15-04-2020") # 무조건 첫번째 친구를 년도로 인식함.
# 공공데이터에 년월일에 해당하는 데이터가 들어있다.. 그러면 
# as.Date라는 

as.Date("2020,04,15", format="%Y,%m,%d") # 포맷 형식 지정하여 ,도 출력가능하게 함.
as.Date("15-04-2020", format="%d-%m-%Y") # 소문자는 월 대문자는 분으로 인식


(today <- Sys.Date())
format(today, "%Y년 %m월 %d일")
format(today, "%d일 %B %Y년") #대문자 B는 요일을 풀 네임으로 출력.근데 우리나라는 B나 b나 똑같.
format(today, "%y")
format(today, "%Y")
format(today, "%B")
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
# POSIXct 객체면 날짜가 나온다.
Sys.Date()
Sys.time()
Sys.timezone()

as.Date('1/15/2018',format='%m/%d/%Y') 
# format 은 생략 가능 한자리든 두자리든 알아서 인식
# 첫번째가 월, 두번째가 날짜, 세번째가 년도라고 포맷형식 지정.
as.Date('4월 26, 2018',format='%B %d, %Y')


as.Date('110228',format='%d%b%y')
#as.Date('110228',format='%d%m%y')
#NA가 나오는 이유?? : b는 월을 이름으로 나타내는건데 이포맷을 나타내고 싶으면 02가 아니라 2월로 해야함.
# %b가 아니라 %m을 해줘야 한다.
# 02  %b
# 2월 %m
Sys.setlocale("LC_TIME", "English") # 영어권 형식으로 바꿔라 ex) April
Sys.setlocale() # 기본세팅으로 다시 바꿔

x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S") # PoSIXlt or POSIXct 객체로 바꿔야 시분초까지 나옴.
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S") # format 문자열 지정은 필수
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")

strptime('2020-12-25 23:59:59', "%Y-%m-%d %H:%M:%S")
as.Date('12/25/2020 23:59:59',"%Y-%m-%d %H:%M:%S")

start <- as.Date("2020-01-01")
end <- as.Date("2021-01-01")
seq(start, end, 1) # 1씩 증가되는 데이트 객체..

seq(start, end, "day")
seq(start, end, "week")
seq(start, end, "month")
seq(start, end, "year")
seq(start, end, "3 month")
seq(start, end, length.out=7) # start부터 end까지의 날짜데이타를 기준으로 7개 조각내서 내보내라


x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d") # 0시0분0초로 처리됨.
str(datetime)

# Date 객체는 날짜만 나타낼 수 있으며 시간처리 불가
# 날짜와 시간을 함께 처리하려면 POSIXct 또는 POSIXlt 타입의 객체 사용

pct <- as.POSIXct("2020/04/15 11:30:20") # 일반적으로 시분초는 콜론으로 구분됨. 
plt <- as.POSIXlt("2020/04/15 11:30:20") # 결과만 봤을때는 POSIXct 인지 lt인지 구분 안됨.
pct
plt
class(pct)
class(plt)
as.integer(pct) # as.integer로 하면 1970년1월1일 0시를 기준으로 초를 셈.
# 내부적으로 뉴머릭 객체가 생성됨. 실제 보관되는 초시간 정보뽑을 수 있지만,
as.integer(plt) # 내부적으로 리스트가 생성됨. 
unclass(plt)
# unclass를 이용해서 객체상태 해제하여 리스트임을 확인할 수 있음.
plt$sec
plt$min
plt$hour
plt$mday
plt$mon # 0 - 1월 ----월이 0부터 시작함을 알 수 있음.
plt$year
plt$wday # 0-일요일 이번주에서 무슨요일이냐 



t<-Sys.time()
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
str(ct) 
str(lt) 
unclass(ct)  # 객체상태 해제하니까 뉴머릭 객체가 들어있음.
unclass(lt)  # 객체상태 해제하니까 리스트
lt$mon+1
lt$hour
lt$year+1900
as.POSIXct(1449994438,origin="1970-01-01") # 저만큼 초시간이 지날때 origin을 기준으로 시간정보보
as.POSIXlt(1449994438,origin="1970-01-01")


#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2020-12-25")
weekdays(christmas2)
christmas2$wday
#2020년 1월 1일 어떤 요일
tmp<-as.POSIXct("2020-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
format(tmp,'오늘은 %Y년 %B %d일 %A입니다') # sql과 달리 포맷문자가 아닌거 그대로 표현함.
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="") # 각각추출해서 paste하면 됨.

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00")
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")
# 뺄셈 연산도 가능함. 












# 문자열 처리 관련 주요 함수들

x <- "We have a dream"
nchar(x)
length(x)

# nchar는 블랭크 포함 문자 개수
# length는 원소의 개수

y <- c("We", "have", "a", "dream")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14) # 자르는거
substring("Data Analytics", 6) # 스타트 인덱스만 줘서 끝까지 뽑아내는 애.

classname <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

data()
head(islands)
landmesses <- names(islands)
landmesses


# 중요
grep(pattern="New", x=landmesses)
# grep이라는 함수 파일을 알아서 특정 단어가 있으면 출력해줌
# 맥은 리눅스 윈도우 중간 리눅스에 가까움
# 윈도우는 사무용,, 리눅스는 유용한 유틸리티가 많아서 좋음 편함.
# x라는 데이터 셋안에 landmesses중에  단어중에 new가 있는것만 꺼내줘줘


index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T) # 인덱스 뽑아내려면 T생략 , 즉, T있으면 데이터값뽑아냄.


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt) # 최초에 찾은 자료에 Data라는 단어 찾아서 Business로 바꿔라
gsub(pattern="Data", replacement="Business", x=txt) # gsub는 모두 적용용

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x)

words <- c("ct", "at", "bat", "chick", "chae", "cat", "cheanomeles", "chase", "chasse",
           "mychasse", "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T) # che가 들어가는애
grep("at", words, value=T) # at이 들어가는애애
grep("[ch]", words, value=T) # [ch] 대괄호 안에서는 문자 하나하나가 or임.. c또는 h가 들어가있는애 다꺼냄.
grep("[at]", words, value=T) # [at] a 또는 t가 들어간애들 다 뽑아냄.
grep("ch|at", words, value=T) # ch를 한묶음, at를 한묶음으로 인식해서 or링..
grep("ch(e|i)ck", words, value=T) #check나 chick 찾는거임.
grep("chase", words, value=T)
grep("chas?e", words, value=T) # 0개 또는 1개
grep("chas*e", words, value=T) # 0개이상
grep("chas+e", words, value=T) # 1개 이상상
# 텍스트 마이닝할때 많이 쓰임
grep("ch(a*|e*)se", words, value=T) # a또는 e가 0개이상있는..
grep("^c", words, value=T) # ^c c로시작하는... []안에있으면 c를 제외한..
grep("t$", words, value=T) # t로 끝나는...
grep("^c.*t$", words, value=T) # 반드시 c로 시작하고 반드시 t로끝나는데, 그 사이에는 무슨문자가
#오든 상관 없음.

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE) # 알파뱃과 숫자있는 애 뽑아줘줘
grep("[[:alpha:]]", words2, value=TRUE) # 알파뱃있는애 데이터 뽑아줘줘
grep("[[:digit:]]", words2, value=TRUE) # 숫자 있는 애 뽑아줘
grep("[[:punct:]]", words2, value=TRUE) # 특수문자 있는 애 뽑아줘
grep("[[:space:]]", words2, value=TRUE) # 공백있는 애 뽑아 줘
grep("\\w", words2, value=TRUE) # word character (a-, 0-) 뽑아줘
grep("\\d", words2, value=TRUE) # 숫자애들 뽑아줘
grep("\\s", words2, value=TRUE) # 스페이스바 있는 애 뽑아줘 



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ") # 반환하는 결과가 리스트
strsplit(x= fox.said, split="") # 분리하는 문자열 안주면 문자마다 분리함.

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]
































# dplyr 패키지를 학습하자....

install.packages("dplyr") 
library(dplyr)
install.packages("ggplot2") # 어드밴스드 시각화 api 금토에 공부할것.
str(ggplot2::mpg) # 패키지이름 :: 함수 데이터셋 구조만 볼때.. 로드는 안할때사용
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
exam <- read.csv("data/csv_exam.csv")
str(exam)
dim(exam)
head(exam);tail(exam)
View(exam)
# exam에서 class가 1인 경우만 추출하여 출력
exam %>% filter(class == 1) # [참고] 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력
# 2반인 경우만 추출
exam %>% filter(class == 2)
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3)
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
# 영어점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# 영어점수가 80점 이하인 경우
exam %>% filter(english <= 80)
# 1반 이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 2반 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5)  # 1, 3, 5 반에 해당되면 추출
# %in% 연산자 이용하기
exam %>% filter(class %in% c(1,3,5))  # 1, 3, 5 반에 해당하면 추출
# 1이거나 3이거나 5이면~~~

# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기


exam %>% select(math)  # 전달된 값 중에서 math 컬럼만 추출
exam %>% select(english)  # english 추출
# 여러 변수 추출하기
exam %>% select(class, math, english)  # class, math, english 변수 추출
# 변수 제외하기
exam %>% select(-math)  # math 제외
exam %>% select(-math, -english)  # math, english 제외
# dplyr 함수 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)
#체이닝 함수로 결과값을 다음행에 넘김


# 가독성 있게 줄 바꾸기
exam %>% # 체이닝 함수는 앞에 올 수 없음.... 항상 마지막..
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head                  # 앞부분 6행까지 추출 

#데이터프레임을 받을 수 있는 애면 얼마든지 같이 써도 상관 없음.


# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출

iris %>% pull(Species) # 꽃 종 풀은 벡터로 꺼내줘서 1개만 지정가능
iris %>% select(Species) # 셀렉트는 데이터프레임으로 꺼내줌.
iris %>% select_if(is.numeric) # 뉴머릭에 해당되는 변수들만 꺼내시오.
#
iris %>% select(-Sepal.Length, -Petal.Length)

# Select column whose name starts with "Petal"
iris %>% select(starts_with("Petal")) # 꽃
#변수명이 petal로 시작하는 아이들.

# Select column whose name ends with "Width"
iris %>% select(ends_with("Width"))

# Select columns whose names contains "etal"
iris %>% select(contains("etal"))

# Select columns whose name maches a regular expression
iris %>% select(matches(".t."))


# 오름차순으로 정렬하기
exam %>% arrange(math)  # math 오름차순 정렬
# 내림차순으로 정렬하기
exam %>% arrange(desc(math))  # math 내림차순 정렬
# 정렬 기준 변수 여러개 지정
exam %>% arrange(desc(class), desc(math))  # class 및 math 오름차순 정렬
# 클래스로 내림차순 정렬하고, 매스 내림차순 정렬하고 정렬렬
exam %>% arrange(desc(math)) %>% head(1) # 수학점수가 제일 높은 학생.
# 셀렉트는 서브쿼리 로우넘 써야해서 별로임.

exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head                                          # 일부 추출
# mutate : 없던 컬럼을 하나 추가하는거임.
# total을 이라는 변수를 추가하는 것.

#여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = (math + english + science)/3) %>%   # 총평균 변수 추가
  head     
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = total/3) %>%   # 총평균 변수 추가
  head 

# 일부 추출
# mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출
  # 20행 6열짜리가 전달됨..          3 점수의 합.
  # 133부터 193까지..
