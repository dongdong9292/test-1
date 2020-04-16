# [문제1]
V1 <- 1:10
V2 <- (V1)*2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1;v2;v3;max_v;min_v;avg_v;sum_v

# [문제2]
seq(1,9, by=2)
rep(1, 5)
rep(1:3, 3)
rep(1:4, each=2)

# [문제3]
nums <- sample(1:100, 10)
sort(nums)
sort(nums, decreasing = T)
nums[nums>50]
nums[nums<=50]
which.max(nums)
which.min(nums)
# which는 인덱스 추출

# [문제4]
v8 <- seq(1,10, by=3) #c함수 사용해도 됨. seq(1,10,3) 으로 써도 됨.
names(v8) <- LETTERS[1:4]

#[문제5] 
score <- sample(1:20, 5)
myFriend <- c("둘리", "또치", "도우너", "희동", "듀크")
paste(score, myFriend, sep = "-") #paste0는 sep가 디폴트 0인 함수.
# 페이지 옮겨가게끔 할때 페이지1,2,3,4 넘버를 전달해야함.
# 그때 페이스트 함수를 url 문자열 결합시 사용.
myFriend[which.max(score)]
myFriend[which.min(score)]
myFriend[which(score > 10)]

