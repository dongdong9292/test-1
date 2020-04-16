# 문제1
countEvenOdd = function(x){
  even = 0
  odd = 0

  if(!(is.vector(x)&is.numeric(x))){
    return()
  }
  else{
    for(i in x){
      if(i%%2==0)
        even=even+1
      else
        odd=odd+1
    }
    list1 = list(even=even,odd=odd);
    return(list1)
  }
}
cat("짝수의 개수 : ",unlist(countEvenOdd(c(3,3,4,5)))[1],
    " 홀수의 개수 : ",unlist(countEvenOdd(c(3,3,4,5)))[2])

# 문제2
vmSum = function(x){
  if(!is.vector(x)){
    print("벡터만 전달하숑!")
    return();
  }
  else{
    if(!is.numeric(x)){ 
      print("숫자 벡터를 전달하숑!")
      return();
    }
    else{
      return(sum(x))
    }
  }
}
vmSum(c(3,3,1,1))
vmSum(c("d","d"))
vmSum(matrix())

# 문제3
vmSum2 = function(x){
  if(!is.vector(x)){
    stop("벡터만 전달하숑!")
  }
  else{
    if(!is.numeric(x)){
      warning("숫자 벡터를 전달하숑!")
      return();
    }
    else{
      return(sum(x))
    }
  }
}
vmSum2(c(3,3,1,1))
vmSum2(c("d","d"))
vmSum2(matrix())

# 문제4
mySum = function(x){
  if(!is.vector(x)){
    print("1")
    stop("벡터만 처리 가능!!")
  }
  else{
    print("2")
    # x[is.na(x)] 이렇게 하면 모든 x의 원소에 대해 트루 폴스 알려줌..
    if(any(is.na(x))){
      warning("NA를 최저값으로 변경하여 처리함!!")
      for(i in 1:length(x)){
        if(is.na(x[i]))
          x[i] = 0;
      }
    }
    
    else if(is.null(x))
      return()
    else{
      oddSum = 0
      evenSum = 0
      for(i in x){
        if(i%%2==0)
          even=even+1
        else
          odd=odd+1
      }
      list1 = list(even,odd);
      return(list1)
    }
   }
}
cat("짝수의 개수 : ",unlist(mySum(c(3,3,4,4)))[1],
    " 홀수의 개수 : ",unlist(mySum(c(3,3,4,4)))[2])









# 문제5
myExpr = function(x){
  if(!is.function(x))
    stop("수행 안할꺼임!!")
  else{
    x(sample(1:45,6))
  }
}
myExpr(function(...){print(...)})
myExpr(sum)
myExpr(mean)

?sum





# 문제6
createVector1 = function(...){
  p = c(...)
  if(is.null(p))
    return()
  else if(any(is.na(p)))
    return(NA)
  else
    return(p)
}
createVector1(1,2,3)
createVector1("a","c")
createVector1(1,NA,3)
createVector1()


# 문제7
createVector2 = function(...){
  p = list(...)
  if(is.null(p))
    return()
  else{
    
    gg1 = NULL
    gg2 = NULL 
    gg3 = NULL
    
    for(i in p){
      # 직접 쓸때는 겹대괄호 벗겨야하는데
      # for문을 통해 접근할 때는 알아서 벗겨서 연산해줌~
    if(is.numeric(i)){ gg1 = c(gg1,i)} # gg1 = append(gg,i)로 붙이면 됨.
    else if(is.character(i)) gg2=c(gg2,i)
    else if(is.logical(i)) gg3=c(gg3,i)
    }

    return (list(gg1,gg2,gg3))
  }
}
createVector2(1,2,c(1,2,3))

# 문제8
lines<- scan("data/iotest1.txt")
cat("오름차순 : ",sort(lines),"\n")
cat("내림차순 : ",sort(lines,decreasing=T),"\n")
cat("합 : ",sum(lines),"\n")
cat("평균 : ",mean(lines),"\n")




# 문제9
lines <- scan("data/iotest2.txt",encoding="UTF-8", what="")

lines = as.factor(lines)
summary(lines)[1]
max = 0
for(i in 1:6){
  if(max<summary(lines)[i])
    max = summary(lines)[i]
}
table(max)
cat("가장 많이 등장한 단어는 ",names(max)," 입니다.")
 
# iotest2 = scan(file="data/iotest2.txt",what="")
# a = table(iotest2)
# cat("가장 많이 등장한 단어는 ",names(a[which.max(a)]))
# paste("가장 많이 등장한 단어는 ",names(max)," 입니다.")
# rm
