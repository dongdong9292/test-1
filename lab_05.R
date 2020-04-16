# 문제1
grade = as.character(sample(1:6, 1))
result = switch(EXPR=grade, 
       "1"=,"2"=,"3"="학년은 저학년입니다.",
       "4"=,"5"=,"6"="학년은 고학년입니다.");result
paste(grade,result,sep=" ")

# 문제2
choice = sample(1:5, 1)
result = switch(EXPR=choice,
                300+50,300-50,300*50,300/50,300%%50)
paste("결과값", result, sep=" : ")

# 문제3
count = sample(3:10, 1)
deco = sample(1:3, 1)
operator = switch(EXPR=deco, "*","$","#");operator
for(i in 1:count)
  print(operator)

# 문제4
score = sample(0:100, 1)
score.imsi = as.character(score%/%10)
level = switch(EXPR=score.imsi,"6"="D","7"="C","8"="B","9"="A","10"="A","F")
print(paste(score, "점은", level, "등급입니다.", sep=" "))
#cat(score, " 점은",level, : 등급입니다")


# 문제5
UpperL = LETTERS[]
lowerL = letters[]
alpha=paste0(UpperL, lowerL)
print(alpha)