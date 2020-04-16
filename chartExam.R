# 문제1
상품 = read.table("data/product_click.log")
상품 = 상품$V2
class(상품)
png(filename="clicklog1.png", height=400, width=700, bg="white")
plot(상품, main="세로바 그래프 실습",
        xlab="상품ID", ylab="클릭수",border="black",
        col=terrain.colors(10))
dev.off()

# 문제2
시간 = read.table("data/product_click.log")
시간 = 시간$V1
png(filename="clicklog2.png", height=400, width=700, bg="white")
pie(table(substr(시간,9,10)),
      labels=paste(seq(0,20,1),"~",seq(1,21,1)),
      main="파이 그래프 실습",
      col=rainbow(20))
dev.off()

