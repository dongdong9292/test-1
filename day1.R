# R 공부 열심히 하자
v1 <- 1:10
v2 <- v1 + 10
print(v2)
v1
v1 <- c(4, 1, 8, 6, 10)
#변수에 담을때는 콘솔창에 안뜨지만 c함수만 단독으로 실행했을때는 출력값이 나온다.
print(v1)
v1
#변수명만 실행시키면 자동으로 프린트 함수가 실행된다.
#이전에 대입했던 1:10은 사라진다.
?seq

?rep #help()
# 어떤 함수의 도큐먼트를 보고싶다 하면  ?함수 하면 됨.
rep(1, 100) # 하나의 원소를 갖는 벡터. 100번을 반복해라.
rep(1:3, 5) # 123이라는 벡터를 5번 반복해라.
rep(1:3, times=5) # times라는 매개변수에 5를 전달하면 5번 실행.
# 타임즈가 rep의 2번째 매개변수임.. 순서에 의해 times에 전달하게 됨.
# times를 건너뛰고 each에 전달하고 싶으면 each라고 명시해야 함.
# R은 5라는 값만 전달하는게 아니라 전달하고자 하는 값 앞에 변수명을 써도됨. 키워드 파라미터
rep(1:3, each=5) #time과 each의 차이점 : each 각 원소를 5번씩 반복, times 전체 반복 


LETTERS
letters
month.name
month.abb
pi

LETTERS;letters;month.name;month.abb;pi
#공간이 아깝다하면 한줄로 쓰고 세미콜론으로 구분하면 됨.

LETTERS[1];LETTERS[c(3,4,5)];LETTERS[3:5];LETTERS[5:3];
LETTERS[-1]; # -1을 주면 첫번째 인덱션 빼고 출력.
LETTERS[c(-2,-4)] # 2번째와 4번째꺼 빼고 출력. 

length(LETTERS)
length(month.name)
length(pi)


x <- c(10,2,7,4,15)
x
print(x)
class(x) # 저장된 값들의 타입이 무엇이냐에 따라 클래스함수에서 알 수 있음.
rev(x) # 역순
range(x) # 최소값 최댓값
sort(x) # REV든 소트든 아규먼트를 변경시키는게 아니라 결과값만 나타냄.
sort(x, decreasing = TRUE) #기본적으로(디폴트) 어센던트 소팅을 수행..
sort(x, decreasing = T)
#
x <- sort(x)
order(x) # 실제 인덱스의 위치로 출력함.
# order함수를 알아야지 사원 DB테이블을 가지고 분석을 할때 월급이 많은 순 월급이 적은 순.
# 월요일 실습 내용. 
?order


x[3] <- 20 # 3번째 원소를 20으로 변경경
x 
x + 1 #원소마다 연산되는것을 벡터연산이라 함.
x <- x + 1 # 각 원소마다 +1

max(x);min(x);mean(x);sum(x)
summary(x)
# 수치 데이터 잔뜩 주고 요약해라..
# mean 중간 값
# 학생의 성별을 담고 있는 벡터를 주면 주어진 아규먼트가 범주형 벡터냐 그냥 벡터냐(숫자, 문자)
# 에 따라 summary의 값이 달라짐. 
# 따라서 summary 함수는 엄청 많이 쓰임.
x[c(2,4)] # x[2], x[4]
x
x[c(F,T,F,T,F)]#트루인애만 ~~
# x[c(T,F)]  얘를 실행하면 어떻게 되는가  T, F ,T, F, T 반복~~ 
x > 5 # 5하고 비교해서 원소값이 크면 트루 작으면 폴스
x[x > 5]  # 이 조건을 만족하는 원소값만 꺼내는거다. 
x[x > 5 & x < 15] # &두개짜리를 쓰면 안된다. 
# x[x>5 && x<15] 2개짜리 몰라도 됨. 2개짜리 연산자는 첫번째 원소를 기준으로 나머지 다 출력함. 
# x[x>5 && x<10] 일부 R 책들은 2개짜리 설명안함 
#x[x > 5 | x < 15]

names(x) # 아규먼트로 주어진 벡터에 맵핑되어 있는 네임 벡터를 추출할때 사용하는 함수.
# 네임벡터는 원소마다 이름이 부여되어있는 벡터.
# 네임즈는 네임벡터를 리턴하는 함수
names(x) <- LETTERS[1:5] # 네임벡터로 대문자 ABCDE 
#x라는 벡터에 들어있는 원소와 별개로 네임으로 ABCDE가 붙여짐. 
names(x) <- NULL #네임에는 명사 밸류에는 갯수 
x[2];x["B"]
x
x[B] # 인용부호를 안붙여주면 B는 변수가 됨. 그러려면 B라는 객체가 만들어져 있어야 함.  
# R은 변수를 객체라고함..
X[B()] # 소괄호 없으면 객체, 소괄호 있으면 함수의 리턴값으로 인식함.

# 각각의 원소마다 이름이 부여되어 있으면 이름을 숫자 인덱스 대신 사용할 수 있다.
# 

# &, &&
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
c(T, T, F, F) && c(T, F, T, F)
c(T, T, F, F) || c(T, F, T, F)


ls() # 파일 리스트 출력 리눅스 명령어를 여기서는 함수로 제공 // 지금까지 만든 객체를 보여줌
rm(x) # // x를 삭제
x
class(x) # x 벡터의 타입이 무엇인지 알려줌 "numeric"

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100] # 비교식이 인덱스로 들어가면 강수량이 100보다 큰 월의 강수량 정보가 나옴,

which(rainfall > 100) # rainfall>100 의 결과값을 which 함수에 전달하면 인덱스가 나옴.
# 즉 true인 월을 나타내줌.. // 강수량이 100보다 큰 월을 출력

month.name[which(rainfall > 100)] # month.name이라는 내장객체에 100보다 큰 월을 매개변수로 전달.
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
#month.korname 이라는 객체를 만들어서 c라는 네임 벡터를 대입해줌. 

month.korname[which(rainfall > 100)]
which.max(rainfall)
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


sample(1:20, 3) # 1~20까지 3가지 랜덤 숫자를 뽑는거 
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T) # replace = T 하면 중복허용.


count <- sample(1:100,7)
month.korname <- c("일요일", "월요일", "화요일",
                   "수요일", "목요일", 
                   "금요일", "토요일")
ls()

paste(month.korname, count, sep = ":") # 결합할 때 중간에 콜론을 붙이겠다는 뜻
# sep를 생략하면 디폴트는 공백 
# paste 함수는 결합해주는 함수
# R에서는  + 연산자가 문자열 결합 연산으로 처리할 수 없음.

month.korname
month.korname[which.max(count)] # 최대값에 해당하는 요일을 출력해라 which는 인덱스 출력해줌...
month.korname[which.min(count)]
month.korname[which(count > 50)]

paste(month.korname, count, sep = " : ")

paste("I'm","Duli","!!") # 몇개가 오던 ... 붙이는 매개변수가 되기때문에 구분을 하고 싶으면 sep를 줘야함.
paste("I'm","Duli","!!", sep="")
paste0("I'm","Duli","!!") 

#paste와 paste0는 기본적으로 사용하는 sep 의 공백여부 차이.

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-") #collapse는 
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")

#paste (..., sep = " ", collapse = NULL)
#paste0(..., collapse = NULL)


