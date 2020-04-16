
# matrix 실습
x1 <-matrix(1:8, nrow = 2) # 바이로우 생략했으니 열 우선.. 데이터값 열 우선 채워짐.
# 벡터 
x1
x1<-x1*3
x1

sum(x1); min(x1);max(x1);mean(x1)
x2 <-matrix(1:8, nrow =3)
#x2 <-matrix(1:8, nrow =3, byrow=TRUE) # byrow = True 이므로 행이 우선적으로 채워진다.
x2


(chars <- letters[1:10]) # "a", "b", ... , "j"
# chars <- letters[1:10] 소괄호를 빼고 실행시키면 대입문만 일어남.
# 소괄호를 같이 실행하면 대입과 출력을 동시에 해줌. 
# chars에 대입한 변수에 어떠한 데이터셋이 들어가있는지 확인하려면 괄호로 묶는것도 하나의 방법.

mat1 <-matrix(chars) 
# 매트리스 만들때 행,렬 줘야하는데 아무것도 안주면..
mat1;# 10행 1열.. 디폴트가 열우선이므로 열이 채워짐.. 
dim(mat1) # 몇행 몇열인지 알려주는 함수

dim(matrix(chars, nrow=1))  # 1 10
dim(matrix(chars, nrow=5))  # 5 2
dim(matrix(chars, nrow=5, byrow=T)) # 5 2
dim(matrix(chars, ncol=5))  # 2 5
dim(matrix(chars, ncol=5, byrow=T)) # 2 5
dim(matrix(chars, nrow=3, ncol=5))  # 3 5
dim(matrix(chars, nrow=3)) # 3 4


vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)

mat1 <- rbind(vec1,vec2,vec3); mat1 #행단위 붙임
mat2 <- cbind(vec1,vec2,vec3); mat2 #열단위 붙임
# rbind, cbind는 데이터가 가변형임. 
mat1[1,1] # 매트1을 가지고 1행 1열을 꺼내라는 뜻
mat1[2,];mat1[,3] # 2행의 모든열 , 3열의 모든 행 (없는거는 all이라는 뜻) 
# 행이나 열에 이름이 있으면 그이름을 최대한 저굥ㅇ해서 출력.
# 1행 1열 벡터로도 충분 
mat1[1,1,drop=F] # 행, 열, 드랍  드랍 = F 이면 1행1열이지만 매트리스 구조 유지
# 드롭 속성은 디폴트값이 TRUE, 
# 매트리스 구조 유지할 필요없으면 알아서 유지하지 않음. 

mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL # 행이나 열의 이름을 없애고 싶으면 NULL을 통해 없애줌 
colnames(mat2) <- NULL # vel1 vec2 vec3가 사라짐..
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls()

mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2) # 열단위로 summary 해서 나타내줌 

mean(x2[2,]) # 2번째 행에 대한 모든 열에 대하여 평균을 내시오
sum(x2[2,])  # 2번째 행에 대한 모든 열에 대하여 합계를 내시오 
rowSums(x2); colSums(x2) # row 
x2
apply(x2, 1, sum); # x2를 가지고 행단위로 sum 함수 수행해줘  rowSums와 같음
apply(x2, 2, sum)  # x2를 가지고 열단위로 sum 함수 수행해줘  rowSums와 같음
?apply # array는 matrix를 포함하고 있음. 

apply(x2, 1, max) # 행단위로의 최대값
apply(x2, 1, min) # 행단위로의 최소값
apply(x2, 1, mean) # 행단위로의 평균값

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)


#Array 실습 어플라이실습
a1 <- array(1:30, dim=c(2,3,5))
# 1부터 30까지 숫자를 가지고 2행 3열 5층짜리 
# dim이라는 매개변수에 몇행 몇열 몇층인지 줘야함.
a1

a1[1,3,4] # 어레이구조를 유지하지 않는데, #a1[1,3,4, drop=F]이렇게 주면 어레이행열구조 유지
a1[,,3] # 3층에 있는 모든 식구들이 다 나옴.
a1[,,3]
a1[,2,]
a1[1,,]
rm(a1)



getwd() # Working Directory. // R세션이 하나 열렸다..
# 시스템 문서 디렉토리로 인식 memor

#------------------------------------------------------------------------------------------------------------------------------------------#
# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3) # 숫자 벡터
# c(1,3,2,4,2,1,3,5,1,3,3,3, "3" ) 케릭터 벡터됨.
# 한가지 타입만 가능함. 뉴머릭보다 케릭터가 더 범위가 큰 애임. 케릭터로 자동 변환.
class(score) # R은 클래스는 없지만 내부적으로는 존재함.
summary(score)

f_score <- factor(score)
class(f_score)
f_score
summary(f_score) # factor로 바꾸면 어떤 타입의 팩터든 서머리를 돌리면 각각의 데이터의 개수를 세준다..
# 연속(수치), 연산할 수 있는 데이터가 아니라 범주로 인식..
levels(f_score)

plot(score)
plot(f_score)


data1 <- c("월","수","토","월", "목","화")
data1
class(data1) #벡터의 경우에는 타입만 내보냄.
summary(data1) # 6개의 데이타로 구성되고 Mode에 대한 결과를 출력. 
day1 <- factor(data1) # 팩터로 바꾼 후 출력하면 
day1 # 레벨이 명시됨. 
class(day1)
summary(day1)
levels(day1) # 데이터에 없기 때문에 금, 일 없음. 


week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토")
day2 <- factor(data1,levels=week.korabbname) # level을 전달함.
day2
summary(day2) # 팩터 데이타를 기준으로 한 범주의 데이타 값.
levels(day2)



btype <- factor(
  c("A", "O", "AB", "B", "O", "A"), 
  levels=c("A", "B", "O")) 
# 정해진 범주에(레벨)에 속하지 않는 "AB"
# "AB" 를 NA로 만듬... 레벨을 우선으로 하겠다..
# Not Available NA가 한개라고 표현
btype
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성"))
# 1일때는 남성, 2일때는 여성으로 사용하겠다...
gender
summary(gender)
levels(gender)

# 내장 데이터셋
data() # R이라는 것은 R코드를 실행시켜주는 엔진이 있음.
# R 인터프리터, R 엔진.
# 기본 API들이 들어가 있음.

# 베이스 패키지에 있는애들은 자동으로 사용 가능함.
iris; # 꽃 종류. 데이터 셋.
head(iris) # 앞에서부터 6개
tail(iris) # 뒤에서부터 6개를 보여줌 (아규먼트로 n개를 줄 수 있음)
View(iris) # 유닉스에서는 명령어..
str(iris) # 주로 데이터프레임과 씀. 스트럭처라는 의미의 함수로서 
# 데이타 프레임 150개의 오저베이션(관측치, 행), 5개의 배열 (5가지 변수의 값)
# 데이타가 갖고 있는 각각의 속성들.. 강사의 속성들..
# 베어러블 IT에서의 변수와 통계에서의 변수는 다름.
# 5가지의 변수를 제시하고 있다..
# str 함수는 데이터 프레임에서 필수 함수임..

library();


#Dataframe 실습
no <- c(1,2,3,4) 
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price) # 4행 4열
str(fruit)
View(fruit)
fruit
fruit[1,]
fruit[-1,] # 첫 번째 인덱스는 빼고
fruit[,2]
fruit[,3] # fruit[,3, drop=F]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]


# 3번째 열을 뽑는것은 똑같음.. 
# 
fruit[,3]
fruit$qty # 가장 권장하는 방법
# 개수를 의미하는 구나 명칭은 가독성이 좋음.
# 자바의 . 연산자가 R에서 $ 과 같음..
# 멤버 연산자..
# fruit이 갖고있는 qty 멤버, qty 변수~
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지


str(fruit$qty) #벡터로 추출
str(fruit[3]) #데이터 프레임으로 추출
# 

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(english, math, classnum);df_midterm

str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm)
mean(df_midterm$english)
mean(df_midterm$math)

dataf2 = dataf + c(4,6)


dataf2 <- data.frame(매장명=c(1,2),번호=c(3,4))
dataf2
dataf2 = 
df_midterm2 <- data.frame(c(90, 80, 60, 70), c(50, 60, 100, 20), c(1,1,2,2))
#data.frame을 만들때 벡터를 만들어서 지정.
#
colnames(df_midterm2)
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)


df$var_sum <- df$var1 + df$var2
# df라는 데이터 프레임에 var_sum 이라는 변수를 추가하겠다.
# var1과 var2를 더한것으로... 행단위로 처리됨.
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, "var1이 크다", "var1이 작다")
# 3항 연산자와 기능 똑같음. 

getwd() # setwd('xxx')

#csv파일열기
score <- read.csv("data/score.csv")
# csv는 콤마 세퍼레이트 밸류
# URL을 줘도 읽어옴.

score
str(score)
View(score)

score$sum <- score$math+score$english+score$science
# 3과목을 합산해서 처리. 
score$result <- ifelse(score$sum >= 200,"pass", "fail")
score
#score 변수 출력시 열하나 추가해서 출력

summary(score$result) # 20개로 나오는 이유 캐릭터니까.
table(score$result) # 팩터여야 개수로 나옴
# 테이블 함수는 무조건 개수 샘..
# 팩터든 아니든 무조건 개수 개수


summary(factor(score$result)) # 팩터로 바꾸고 서머리해서 나옴.
score$result = factor(score$result)
str(score)
summary(score)
score$id = as.character(score$id) # 강제 형변환 
score$class = factor(score$class)

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)c
order(v)

emp <- read.csv(file.choose(), stringsAsFactors = F) # 캐릭터를 팩터로 변환 수행 ㄴ
emp
str(emp)

# emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] # drop = FALSE 데이터 프레임 구조 유지
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))
?subset
# emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]

head(emp) #6개 뽑음 tail도 6개
emp

# ename이 "KING"인 직원의 모든 정보
emp[9,] 
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,F,F,F,F,F,F,F,F),]
# 8번째까지 false라서 안꺼냄. 9번째 행 꺼냄. 
# 꺼내고 싶은행에 TRUE로 줘서 뽑을 수 있음..

emp[emp$ename=="KING",]
# 비교식이 참이되는 행만 꺼냄..
subset(emp,subset=emp$ename=="KING")
# subset이라는 함수는 subset이라는 매개변수로 줌.
# 비교식이 참이되는 행만 꺼냄..
subset(emp,emp$ename=="KING")
emp[emp$ename=="KING",]

# 커미션을 받는 직원들의 모든 정보 출력
emp[!is.na(emp$comm),]
# na 아니면 폴스, na면 트루.
# NULL은 등가연산으로 비교 불가..따라서 is.na로 확인
View(emp)
emp

subset(emp,!is.na(emp$comm))

# select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"),subset= emp$sal>= 2000)
subset(emp, emp$sal>= 2000,
       c("ename","sal"))
emp[emp$sal>=2000,c("ename","sal")]

# select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]
















