# 문제1
exam1 = function(){
  sum = paste0(LETTERS,letters)
  return(sum)
}
exam1()

# 문제2
exam2 = function(){
  sum = 0;
  for(i in 1:x)
    sum = sum + i
  return(sum)
}
exam2(5)

# 문제3
exam3 = function(x, y){
  result = 0;
  if(x>y){
    result = x - y;
  }
  else if(x<y){
    result = y - x;
  }
  else
    result = 0
  return(result)
}
exam3(10,20)
exam3(20,5)
exam3(5,5)

# 문제4
exam4 = function(x, y, z){
  result = 0;
  isOperator=switch(EXPR=y,"*"=,"-"=,"*"=,"%/%"=,"%%"="2",
         "1")
  if(isOperator=="1"){
    result = "규격의 연산자만 전달하세요";
  }
  else{
    if(r=="%/%"&y=="%%"&x==0){
      result = "오류1";
    }
    else if(y=="%/%"&y=="%%"&z==0){
      result = "오류2";
    }
    else{
      result = switch(EXPR = y, "+"=(x+z),"-"=(x-z),"*"=(x*z),"%/%"=(x%/%z),"%%"=(x%%z))
    }
  }
  return(result)
}
exam4(5,'f',5)
exam4(5,'*',5)

# 문제5
exam5 = function(x, y="#"){
  if(x<0){
  }
  else{
    for(i in 1:x)
      cat(y)
  }
  return()
  #아규먼트없이 리턴하는 return()을 가급적 추가해라.
}
exam5(5)
exam5(-1)

# 문제6
exam6 = function(x){ 
  for(i in x){
    if(is.na(i)){
      print("NA는 처리불가");
    }
    else{
    if(i>=85&&i<=100)
      print(paste0(i," 점은 상등급입니다."))
    else if(i>=70&&i<=84)
      print(paste0(i," 점은 중등급입니다."))
    else
      print(paste0(i," 점은 하등급입니다."))
  }
  }
  return()
}
# x에는 벡터하나가 오고, x에 전달되는 벡터의 원소개수에 따라 for문 실행 횟수~
exam6(c(80,50,70,66,NA,35));

      