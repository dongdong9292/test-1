# 문제1
str(airquality)

# 문제2
x = c(1,2,3,4,5)
y = c(2,4,6,8,10)
df1 = data.frame(x,y)

# 문제3
df2 = data.frame(col1=c(1,2,3,4,5), 
                 col2=c('a','b','c','d','e'),
                 col3=c(6,7,8,9,10))

# 문제4
prodid = c("사과", "딸기","수박")
price = c(1800,1500,3000)
sales = c(24,38,13)
df3 = data.frame(prodid,price,sales, stringsAsFactors=F)
colnames(df3) <- c("제품명", "가격", "판매량")

# 문제5
mean(df3$가격)
mean(df3$판매량)

# 문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
str(name)
str(gender)
str(math)
# is.name , is.factor, is.numeric
df4<- data.frame(name,gender,math,stringsAsFactors = FALSE)
#(a)
stat <- c(76, 73, 95, 82, 35)
#(b)
score = math + stat
#(c)
grade = ifelse(score>=150,"A",
               ifelse(score>=100 & score<150,"B",
                      ifelse(score<100 & score>=70, "C","D")))
grade
# 문제7
str(emp)
View(emp)

# 문제8
emp[c(3,4,5),]
emp[3:5]

# 문제9
emp$ename
emp[2]

# 문제10
emp$sal
emp[6]

# 문제11
#subset(df, select= 컬럼명들 , 조건)
subset(emp, select=c("ename","sal","job"), subset=(job=="SALESMAN"))

# 문제12
subset(emp, select=c("ename","sal","deptno"), subset=(sal>=1000 & sal<=3000))

# 문제13
subset(emp, select=c("ename","job","sal"), subset=(job!="ANALYST"))

# 문제14
subset(emp, select=c("ename","job"), subset=(job=="ANALYST" | job=="SALESMAN"))

# 문제15
subset(emp, select=c("ename","sal"), subset=(is.na(comm)))

# 문제16
emp[order(emp$sal),] # 월급을 적게받는수으로, 열은 모두 출력..
# emp[1,]
emp$sal= sort(emp$sal)
emp;

# 16번은 subset으로 해결 불가능
# sort(emp$sal) 월급만 소트됨..
# 소트 함수만으로는 월급을 적게받는 순으로 출력하시오 출력 불가능
# order함수는 각 지원들이 받는 월급을 인덱스로 추출.. 
# 제일 적게받는 직원이 몇번째 행에 있다.. emp라는 데이터 프레임에서 행의 인덱싱 대신에 쓰는거임
# 벡터 정렬할때는 sort하면 됨 (그냥 데이터이므로)
# 데이터 프레임을 가지고 정렬하겠다 하면은 order함수의 실행결과를 행의 인덱스로 넣어주면 됨.

#-------------------------------------------------------------------------------------------------------------------
y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 #작은 애가 큰 애한테 맞춤.. 이놈과 같음 -> # c(50, 50, 50, 50, 50)
y > 50

num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2
num1 %% num2
num1 %/% num2






