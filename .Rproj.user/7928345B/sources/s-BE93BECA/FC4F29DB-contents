x <- 70
func5 <- function() {
  x <- 10
  y <- 20
  #수행이 끝나면 없어지는 변수.
  x <<- 40  # 외부 변수 x 를 수정
  return (x+y)
  # 지역변수가 우선적으로 호출
  # x하고 y를 값으로 사용할 때 가까이 있는것을 호출
}
func5()  
x

#전역변수/지역변수
a<-3;b<-7;c<-11 
ft<-function(a){
  b<-a+10     
  c<<-a+10   # 전역대입연산 
  d<-a
  print(a);print(b);print(c);print(d)
  return()  # NULL
}
print(ft(100))
print(a);print(b);print(c);print(d) 





# invisible()함수 
ft.1 <- function(x) return()
ft.2 <- function(x) return(x+10)
ft.3 <- function(x) invisible(x+10)
# 수행문장이 하나라 리턴문 생략 
# invisible은 visible 하지 않은 리턴
ft.1(100)
ft.2(100)
ft.3(100)

r1 <- ft.1(1000);r1
r2 <- ft.2(1000);r2
r3 <- ft.3(1000);r3


testParamType <- function(x){
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}
#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.
testParamType(100)
testParamType(LETTERS)
testParamType(data.frame()) # 특별한 형태의 리스트.. 모든 형태가 같은 타입인 리스트.
testParamType(matrix()) # 2차원 array
testParamType(list()) # 리스트는 벡터의 확장이라고 보고 있음.
testParamType(array())
testParamType(mean) # mean은 함수.


#testParamType
testParamType1 <- function(x){
  result <- NULL
  if(is.vector(x)  && !is.list(x)) result <-"벡터를 전달했군요!"
  else if(is.data.frame(x)) result <- "데이터프레임을 전달했군요!"
  else if(is.list(x)) result <- "리스트를 전달했군요!"
  else if(is.matrix(x)) result <- "매트릭스를 전달했군요!"
  else if(is.array(x)) result <- "배열을 전달했군요!"
  else if(is.function(x)) result <- "함수를 전달했군요!"
  return(result)
}

#dataframe이 list에, list는 vector에 포함 됨 #list는 원소 1개 짜리 1차원 배열과 같다.....?

testParamType1(100)
testParamType1(LETTERS)
testParamType1(data.frame())
testParamType1(matrix())
testParamType1(list())
testParamType1(array())
testParamType1(function(){})

#stop() 함수
testError1 <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  return(rep("테스트",x))
}
# R에서 stop() 함수는 에러를 발생시키는 함수.
# rep(1,2) 는 1이라는 데이터를 2번 반복해라.
testError1(5)
testError1(0)

# 에러처리 후 중단 stop.

#warning() 함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}
# warining은 경고를 발생시키는 함수.
# 에러는 원하지만 중단시키기는 싫을 때 warning()

testWarn(3)
testWarn(10)

test1 <-function(p){
  cat("난 수행함\n")
  testError(-1)
  cat("나 수행할 까요? \n")
}
test1()
# testError라는 함수를 못찾고, 다음 cat() 실행 못함.
# p가 없는데 오류 안나오는 이유... p를 함수 내부에서 실행하지 않기 때문에.

#try()
test2 <- function(p){
  cat("난 수행함\n")
  try(testError(-1))
  cat("나 수행할 까요? \n")
}
test2()
# 못찾겠다는 에러는 에러고, 밑에도 계속 수행함.
# 에러가 발생할 가능성이 있는 부분을 try로 감싸는 것임.
testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError1(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError1(2))
      print(testWarn(3))
    }
  },warning = function(w){
    print(w)
    cat("-.-;;\n")
  }, error = function(e){
    print(e)
    cat("ㅠㅠ \n")
  },finally ={
    cat("오류, 경고 발생 여부에 관계없이 반드시 수행되는 부분입니다요..\n")
  })
}
# tryCatch 구문..
# 에러가 발생하면 이 함수를 실행해라..
# warning과 에러는 값으로 function을 전달함. 
# 발생한 에러에 대한 정보를 보냄.
# ㅇ

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")


f.case1 <- function(x) {
  if(is.na(x)) 
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30)) 
f.case1(c(NA, 20))
f.case1(c(10, NA, 20))
# 여러개 오면 첫 번째 원소만 확인 -> is.na는 하나의 값만 확인하는 함수임.
# na가 하나라도 있는 벡터를 sum 하면 na를 리턴하므로, any와 all


f.case2 <- function(x) {
  if(any(is.na(x))) 
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA, 20))
f.case2(c(10, NA, 20))

# any, all



f.case3 <- function(x) {
  if(all(is.na(x))) 
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}

f.case3(100)
f.case3(LETTERS)
f.case3(NA)
f.case3(c(NA, NA, NA))
f.case3(c(NA, NA, 10))


#Sys.sleep(초시간) 함수
testSleep <- function(x) {
  for(data in 6:10) {       
    cat(data,"\n")
    if(x)
      Sys.sleep(1)
  }
  return()
}
testSleep(FALSE)
testSleep(TRUE)


p <- c(10,20)
data <- 1:10
opts <- ifelse(length(p), p, "")
print(p)
print(opts)

# 가변형 인자 테스트
funcArgs <- function(...) {
  p <- c(...)
  data <- 1:10
  #opts <- ifelse(length(), p, "")
  if(length(p)>0)
    opts = p
  else
    opts = ""
  
  print(p)
  print(opts)
  if(opts[1] == "")
    print(data)
  else 
    for(opt in opts) {
      switch(EXPR=opt,
             SUM=, Sum=, sum= print(sum(data)),
             MEAN=, Mean=, mean= print(mean(data)),
             DIFF=, Diff=, diff= print(max(data) - min(data)),
             MAX=, Max=, max= print(max(data)),
             MIN=, Min=, min= print(min(data)),
             SORT=, Sort=, sort= print(sort(data))
      )
    }
}
sum
funcArgs(c(1,2,3))
funcArgs("sum")
funcArgs("sum","")
funcArgs("sum")

funcArgs(sum)
funcArgs()
funcArgs("10")
funcArgs(10,20)


# funcArgs(c(1,2,3))으로 호출하면
# p라는 벡터가 그 값을 가짐
# data라는 벡터 1~10
# 전달된 값이 있으면 p를 출력, 아니면 아무것도 출력  x
# opt에 p를 넣는다.
# p와 opt를 출력
# 전달된 값이 없으면 1부터 10 출력 
