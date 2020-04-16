# 1. ggplot2 패키지에서 제공되는 mpg 라는 데이터 셋의 구조를 확인한다.
# 이 mpg 를 데이터프레임으로 변환하여 mpg 에 저장한다.(as.data.frame())
 install.packages("ggplot2")
 str(ggplot2::mpg) # tibble
 mpg <- as.data.frame(ggplot2::mpg)
# 1-1 mpg의 구조를 확인한다.
 str(mpg)
# 1-2 mpg 의 행의 개수와 열의 개수를 출력한다.
dim(mpg)
# 1-3 mpg의 데이터를 앞에서 10개 출력한다.
mpg %>% head(10)
# 1-4 mpg의 데이터를 뒤에서 10개 출력한다.
mpg %>% tail(10)
# 1-5. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)
# 1-6 mpg를 열 단위로 요약한다.
View(mpg)
mpg %>% summary(select())
# 1-7 mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer) %>% summarise(차량의수 = n())
# 1-8 mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer,model) %>% summarise(차량의수 = n())



#2.
rename(mpg, city = cty, highway = hwy) -> mpg
mpg

# 3. 다음에 제시된 문제를 각각 3-1, 3-2, 3-3, 3-4로 넘버링 하여 해결 코드를 R로 작성한다.
# ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 
# 데이터가 포함되어 있습니다. midwest 데이터를 사용해 데이터 분석 문제를 해결해보세요.
# 3-1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
midwest = as.data.frame(midwest)
str(midwest)
# 3-2. poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.
rename(midwest, total = poptotal, asian=popasian) -> midwest
midwest
# 3-3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들어 보세요
midwest %>% mutate(tpvasian = asian/total)
# 3-4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
midwest %>% summarise(mean(asian)) -> meanasian
midwest %>% mutate(largeAndSmall = ifelse(midwest$asian>as.integer(meanasian),"large","small"))


# 4-1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4이하인 자동차와
# 5이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.
View(mpg)
mpg %>% filter(displ<=4) %>% summarise(mean(hwy)) -> lowerthanfour
mpg %>% filter(displ>=5) %>% summarise(mean(hwy)) -> biggerthanfive

mpg %>% group_by(displ<=4,displ>=5) %>% mutate(가성비 =(ifelse(displ<=4,lowerthanfour,biggerthanfive))) ->gg
View(gg)
# 4-2. 자동차 제조회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota"중 어느 manufacturer
# (자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보세요.
mpg %>% filter(manufacturer=="audi"|manufacturer=="toyota") %>% group_by(manufacturer) %>% summarise(mean(cty))

# 4-3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의
# 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
mpg %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda") %>% summarise(mean(hwy))



# 5-1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에 활용하려고 합니다.
# mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요. 새로 만든
# 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg %>% select(class, cty) -> cc

# 5-2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를 이용해서
# class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 좋은지
# 알아보세요.
cc %>% filter(class =="suv"|class=="compact") %>% group_by(class)%>% summarise(mean(cty))

# 6. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다.
# "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.

mpg %>% filter(manufacturer=="audi") %>% group_by(class,model) %>% head(5)




