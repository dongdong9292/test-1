# 문제1
L1 = list(
  name = "scott",
  sal = 3000
);L1
result1 = L1$sal*2; result1

# 문제2
L2 = list(
  "scott",
  seq(100,300,100)
);L2

# 문제3
L3 = list(
  c(3,5,7),
  c("A","B","C")
);L3
L3[[2]][2] = "Alpha"; L3[[2]][2]

# 문제4
L4 = list(
  alpha=0:4,
  beta=sqrt(1:5),
  gamma=log(1:5)
);unlist(L4[1])+10

# 문제5
L5 = list(
  math = list(95, 90),
  writing = list(90,85),
  reading = list(85,80)
)
L5[[1]]
result = c(unlist(L5[1])[1],unlist(L5[1])[2],
  unlist(L5[2])[1],unlist(L5[2])[2],
   unlist(L5[3])[1],unlist(L5[3])[2])
mean(result)
ls()

# 문제6
time = 32150
our = time%/%3600
minute = time%%3600%/%60
second = time%%3600%%60
paste(paste(paste(our, minute, sep="시간")
      ,second, sep="분"),"", sep="초")
# cat으로 출력해도 됨.

